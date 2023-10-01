# vim:et sts=2 sw=2 ft=zsh
#
# A simple theme that displays relevant, contextual information.
#
# A simplified fork of the original sorin theme from
# https://github.com/sorin-ionescu/prezto/blob/master/modules/prompt/functions/prompt_sorin_setup
#
# Requires the `prompt-pwd` and `git-info` zmodules to be included in the .zimrc file.

#
# 16 Terminal Colors
# -- ---------------
#  1 red
#  2 green
#  3 yellow
#  4 blue
#  5 magenta
#  6 cyan
# default white
#

_prompt_sorin_vimode() {
  case ${KEYMAP} in
    vicmd) print -n ' %F{2}❮%F{3}❮%F{1}❮' ;;
    *) print -n ' %F{1}❯%F{3}❯%F{2}❯' ;;
  esac
}

_prompt_sorin_keymap_select() {
  zle reset-prompt
  zle -R
}
if autoload -Uz is-at-least && is-at-least 5.3; then
  autoload -Uz add-zle-hook-widget && \
      add-zle-hook-widget -Uz keymap-select _prompt_sorin_keymap_select
else
  zle -N zle-keymap-select _prompt_sorin_keymap_select
fi

typeset -g VIRTUAL_ENV_DISABLE_PROMPT=1

setopt nopromptbang prompt{cr,percent,sp,subst}

zstyle ':zim:prompt-pwd:fish-style' dir-length 1

typeset -gA git_info
if (( ${+functions[git-info]} )); then
  # Set git-info parameters.
  zstyle ':zim:git-info' verbose yes
  zstyle ':zim:git-info:action' format '%F{default}:%F{1}%s'
  zstyle ':zim:git-info:ahead' format ' %F{5}⬆'
  zstyle ':zim:git-info:behind' format ' %F{5}⬇'
  zstyle ':zim:git-info:branch' format ' %F{2}%b'
  zstyle ':zim:git-info:commit' format ' %F{3}%c'
  zstyle ':zim:git-info:indexed' format ' %F{2}✚'
  zstyle ':zim:git-info:unindexed' format ' %F{4}✱'
  zstyle ':zim:git-info:position' format ' %F{5}%p'
  zstyle ':zim:git-info:stashed' format ' %F{6}✭'
  zstyle ':zim:git-info:untracked' format ' %F{default}◼'
  zstyle ':zim:git-info:keys' format \
    'status' '$(coalesce "%b" "%p" "%c")%s%A%B%S%i%I%u'

  # Add hook for calling git-info before each command.
  autoload -Uz add-zsh-hook && add-zsh-hook precmd git-info
fi

# Define prompts.
PS1='${SSH_TTY:+"%B%F{1}%n%f@%b%F{3}%m "}%B%F{4}$(prompt-pwd)%(!. %F{1}#.)$(_prompt_sorin_vimode)%f%b '
RPS1='${VIRTUAL_ENV:+"%F{3}(${VIRTUAL_ENV:t})"}%(?:: %F{1}✘ %?)%B${VIM:+" %F{6}V"}${(e)git_info[status]}%f%b'
SPROMPT='zsh: correct %F{1}%R%f to %F{2}%r%f [nyae]? '
