sorin
=====

A fork of the [sorin] theme.

<img width="706" src="https://zimfw.github.io/images/prompts/sorin@2.png">

What does it show?
------------------

  * On the left:
    * `username@hostname` when in a ssh session.
    * Working directory.
    * `#` when you're root.
    * Keymap indicator.
  * On the right:
    * Python [venv] indicator.
    * `✘` when there was an error.
    * `V` when in a vim terminal.
    * Git information when you are in a git repo:
      * Current branch name. When in ['detached HEAD' state], the position or
        commit short hash.
      * `⬆` and/or `⬇` when there are commits ahead and/or behind of remote, respectively.
      * `✭` when there are stashed states.
      * `✚` when there are indexed files.
      * `✱` when there are unindexed files.
      * `◼` when there are untracked files.

Requirements
------------

Requires Zim's [git-info] module to show git information.

[sorin]: https://github.com/sorin-ionescu/prezto/blob/master/modules/prompt/functions/prompt_sorin_setup
[venv]: https://docs.python.org/3/library/venv.html
['detached HEAD' state]: http://gitfaq.org/articles/what-is-a-detached-head.html
[git-info]: https://github.com/zimfw/git-info
