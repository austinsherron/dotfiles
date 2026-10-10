#!/usr/bin/env bash


# INFO: don't load extensions in non-terminal shells
if [ ! -t 0 ]; then
    return
fi

## bash completion #############################################################

# shellcheck disable=SC1090
[[ -f "${COMPLETION_PATH}" ]] && . "${COMPLETION_PATH}"

# NOTE: lsd's generated completion lists every flag on an empty word, and ls is aliased
# to lsd, so "ls <tab>" showed flags instead of files; _longopt completes files by
# default and flags only once a word starts w/ "-"
if type -t _longopt &> /dev/null; then
    complete -o bashdefault -o default -F _longopt lsd
fi

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

# NOTE: must init atuin after fzf
source "${EXTENSIONS_ROOT}/atuin.sh"

