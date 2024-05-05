#!/usr/bin/env bash


## bash completion #############################################################

# shellcheck disable=SC1090
[[ -f "${COMPLETION_PATH}" ]] && . "${COMPLETION_PATH}"

## fzf completion ##############################################################

source "${EXTENSIONS_ROOT}/fzf.sh"

## starship ####################################################################

if which starship &> /dev/null; then
    ulogger info "enabling starship" -t shell -p rc
    eval "$(starship init bash)"
else
    ulogger info "no starship installation found" -t shell -p rc
fi

## atuin #######################################################################

source "${EXTENSIONS_ROOT}/atuin.sh"

