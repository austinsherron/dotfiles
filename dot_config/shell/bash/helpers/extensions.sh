#!/usr/bin/env bash


## bash completion #############################################################

if [[ -f "${COMPLETION_PATH}" ]]; then
    . ${COMPLETION_PATH}
fi

## fzf completion ##############################################################

source "${EXTENSIONS_ROOT}/fzf.sh"

## oh-my-bash ##################################################################

source "${EXTENSIONS_ROOT}/oh-my-bash.sh"

## starship ####################################################################

if which starship > /dev/null 2>&1; then
    eval "$(starship init bash)"
fi
