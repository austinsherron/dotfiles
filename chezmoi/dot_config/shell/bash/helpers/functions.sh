#!/usr/bin/env bash

source "${CODE_ROOT}/lib/bash/utils.sh"


### 1password ##################################################################

op-get() {
    if [[ $# -lt 2 ]]; then
        echo "[ERROR] op-get: item and field are required"
        return 1
    fi

    local item="${1}"
    local field="${2}"

    op item get "${item}" --field label="${field}"
}

## chezmoi #####################################################################

declare -A CM_ALIASES=([a]=apply [d]=diff)

cm() {
    if [[ -n "${CM_ALIASES[${1}]+x}" ]]; then
        chezmoi "${CM_ALIASES[${1}]}"
    else
        # shellcheck disable=SC2068
        chezmoi ${@}
    fi
}

## clipboard ###################################################################

clip-clear() {
    pbcopy < /dev/null
}

diff-clip() {
    tmp="$(mktemp)"
    pbpaste >| "${tmp}"
    diff "${tmp}" "${1}" && rm "${tmp}"
}

pbcf() {
    pbcopy < "${1}"
}

pbpf() {
    pbpaste > "${1}"
}

pbpo() {
    pbpaste > "${1}" && ${EDITOR} "${1}"
}

## files #######################################################################

symlink() {
    if [[ "$#" -lt 2 ]]; then
        echo "[ERROR] symlink: two paths are required"
        return 1
    fi

    ln -s "$(realpath "${1}")" "$(realpath "${2}")"
}

# TODO: parameterize find pattern, create inverse function
unhide() {
  GLOBIGNORE=".:.."
  for file in .*; do
     mv -n "$file" "${file#.}"
  done
}

uz() {
  filename="${1}"
  wo_extension="${filename%.*}"

  unzip "$filename" -d "${wo_extension}"
}

## git #########################################################################

alias get-git-root="git rev-parse --show-toplevel"

git-root() {
    cd "$(get-git-root)" || exit
}

git-ignore() {
    ${EDITOR} "$(get-git-root)/.gitignore"
}

clone-external() {
    local repo="${1}"
    local repo_name

    repo_name="$(basename "${repo}")"

    git clone "https://github.com/${repo}" "${EXTERNAL_PKGS}/${repo_name}"
}

## gpg #########################################################################

gpg-export() {
    mkdir gpg-keychain
    cd gpg-keychain || exit

    gpg --armor --export-secret-keys > priv.asc
    gpg --armor --export > pub.asc
    gpg --armor --export-ownertrust > trust.asc

    if [[ "${1}" != "-c" ]]; then
        return
    fi

    cp ~/.gnupg/dirmngr.conf .
    cp ~/.gnupg/gpg-agent.conf .
    cp ~/.gnupg/gpg.conf .
    cd - || exit
}

## logs ########################################################################

log-ls() {
    if [[ -z "${LOG_ROOT+x}" ]]; then
        echo "[ERROR] log-ls: LOG_ROOT is not set"
        return 1
    fi

    ls "${LOG_ROOT}"
}

log() {
    if [[ -z "${LOG_ROOT+x}" ]]; then
        echo "[ERROR] log: LOG_ROOT is not set"
        return 1
    fi

    local log_name=""

    if [[ -z "${DEFAULT_LOG_TYPE+x}" ]] && [[ "$#" -eq 0 ]]; then
        echo "[ERROR] log: unable to determine log type: none provided and no default set"
        return 1
    elif [[ "$#" -eq 0 ]]; then
        log_name="${DEFAULT_LOG_TYPE}"
    else
        log_name="${1}"
    fi

    local log_path="${LOG_ROOT}/${log_name}.log"

    if [[ ! -f "${log_path}" ]]; then
        echo "[ERROR] log: '${log_path}' is not a log file'"
        return 1
    fi

    vim "${log_path}"
}

## nvim ########################################################################

editor() {
    if [[ -n "$NVIM_LISTEN_ADDRESS" ]]; then
        alias nvim=nvr -cc split --remote-wait +'set bufhidden=wipe'
        export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
        export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    else
        export VISUAL="nvim"
        export EDITOR="nvim"
    fi
}

## system ######################################################################

host-id() {
    hostname -s
}

os-type() {
    uname | tr '[:upper:]' '[:lower:]'
}

## tmux ########################################################################

tmux-env() {
    [[ -n "${1+x}" ]] && local var="TMUX_$(to_upper "${1}")"

    if [[ $# -eq 0 ]]; then
        tmux show-environment
    elif [[ $# -eq 1 ]]; then
        tmux show-environment "${var}" 2> /dev/null | cut -d "=" -f2
    elif [[ $# -eq 2 ]] && [[ "${2}" == "-c"  ]]; then
        tmux setenv -u "${var}"
    elif [[ $# -eq 2 ]]; then
        tmux setenv "${var}" "${2}"
    else
        echo "[ERROR] tmux-env: zero, one, or two arguments, var_name/var_val, required"
        return 1
    fi
}

alias txenv="tmux-env"

tmux-layout() {
    local var="$(tmux display-message -pF '#W')_layout"

    if [[ $# -eq 0 ]]; then
        tmux-env "${var}"
    elif [[ $# -eq 1 ]] && [[ "${1}" == "-c"  ]]; then
        tmux-env "${var}" "-c"
    elif [[ $# -eq 1 ]]; then
        tmux-env "${var}" "${1}"
    else
        echo "[ERROR] tmux-layout: zero or one arguments, layout|-c (clear) expected"
        return 1
    fi
}

alias txlyt="tmux-layout"
