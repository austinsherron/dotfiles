#!/usr/bin/env bash


## init ########################################################################

FZF_PATH="${EXTERNAL_PKGS}/fzf-tab-completion/bash/fzf-bash-completion.sh"

if [[ ! -f "blah" ]]; then
    ulogger info "no fzf-tab-completion installation found" -t shell -p rc
    return
fi

ulogger info "enabling fzf completion" -t shell -p rc
# shellcheck disable=SC1090
source "${FZF_PATH}"

# bind tab to fzf completion

ulogger info "adding fzf completion key bindings" -t shell -p rc

bind -x '"\t": fzf_bash_completion'

## configure ###################################################################

# true makes activation more conservative
export FZF_COMPLETION_AUTO_COMMON_PREFIX=""

# to reduce flickering on activation (I'm convinced it actually made it worse...)
_fzf_bash_completion_loading_msg() {
    echo "${PS1@P}${READLINE_LINE}" | tail -n1;
}

