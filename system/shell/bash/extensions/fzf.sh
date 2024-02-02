#!/usr/bin/env bash


## init ########################################################################

FZF_PATH="${EXTERNAL_PKGS}/fzf-tab-completion/bash/fzf-bash-completion.sh"

if [[ ! -f "${FZF_PATH}" ]]; then
    echo "[INFO] no fzf-tab-completion installation found"
    return
fi

source "${FZF_PATH}"

# bind tab to fzf completion
# TODO: bind seems to cause problems on linux on startup; figure out why/a workaround
bind -x '"\t": fzf_bash_completion'

## configure ###################################################################

# true makes activation more conservative
FZF_COMPLETION_AUTO_COMMON_PREFIX=""

# to reduce flickering on activation (I'm convinced it actually made it worse...)
_fzf_bash_completion_loading_msg() {
    echo "${PS1@P}${READLINE_LINE}" | tail -n1;
}

