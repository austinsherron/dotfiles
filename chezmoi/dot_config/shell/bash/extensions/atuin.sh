#!/usr/bin/env bash


## init ########################################################################

which atuin &> /dev/null && eval "$(atuin init bash --disable-up-arrow)"

## bindings ####################################################################

bind -x '"\C-r": __atuin_history --keymap-mode=vim-insert'
bind -x '"\C-r": __atuin_history --keymap-mode=vim-normal'

