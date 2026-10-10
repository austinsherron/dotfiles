#!/usr/bin/env bash


## init ########################################################################

eval "$(fzf --bash)"

## tab completion ##############################################################

FZF_TAB_PATH="${EXTERNAL_PKGS}/fzf-tab-completion/bash/fzf-bash-completion.sh"

if [[ ! -f "${FZF_TAB_PATH}" ]]; then
    ulogger info "no fzf-tab-completion installation found" -t shell -p rc
    return
fi

ulogger info "enabling fzf tab completion" -t shell -p rc

# shellcheck disable=SC1090
source "${FZF_TAB_PATH}"
bind -x '"\t": fzf_bash_completion'

## configure ###################################################################

# first <tab> completes the shared prefix like normal; the next <tab> opens fzf
export FZF_COMPLETION_AUTO_COMMON_PREFIX=true
export FZF_COMPLETION_AUTO_COMMON_PREFIX_PART=true
