#!/usr/bin/env bash


## init ########################################################################

if which atuin &> /dev/null; then
    ulogger info "enabling atuin" -t shell -p rc
    eval "$(atuin init bash --disable-up-arrow)"
else
    ulogger info "no atuin installation found" -t shell -p rc
    return
fi

## bindings ####################################################################

ulogger info "adding atuin key bindings"
bind -x '"\C-r": __atuin_history --keymap-mode=vim-insert'
bind -x '"\C-r": __atuin_history --keymap-mode=vim-normal'

