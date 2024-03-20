#!/usr/bin/env bash


## bash completion #############################################################

[[ -f "${COMPLETION_PATH}" ]] && . ${COMPLETION_PATH}

## fzf completion ##############################################################

source "${EXTENSIONS_ROOT}/fzf.sh"

## oh-my-bash ##################################################################

source "${EXTENSIONS_ROOT}/oh-my-bash.sh"

## starship ####################################################################

which starship &> /dev/null && eval "$(starship init bash)"

## atuin #######################################################################

# FIXME: this doesn't activate atuin
which atuin &> /dev/null && eval "$(atuin init bash)"

