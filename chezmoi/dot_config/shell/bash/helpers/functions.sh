#!/usr/bin/env bash

source "${BASH_LIB}/args/validate.sh"
source "${BASH_LIB}/core/str.sh"
source "${BASH_LIB}/utils/exec.sh"
source "${BASH_LIB}/utils/file.sh"


## library #####################################################################

source "${BASH_LIB}/log/utils.sh"

## chezmoi #####################################################################

declare -A CM_ALIASES=([a]=apply [d]=diff)

function cm() {
    if [[ -n "${CM_ALIASES[${1}]+x}" ]]; then
        chezmoi "${CM_ALIASES[${1}]}"
    else
        chezmoi "${@}"
    fi
}

## files #######################################################################

function symlink() {
    if [[ "$#" -lt 2 ]]; then
        ulogger error "symlink: two paths are required" -t shell -p util
        return 1
    fi

    ln -s "$(realpath "${1}")" "$(realpath "${2}")"
}

function symlinks() {
    local path="" ; local broken="" ; local valid="" ; local clean=""

    while [[ $# -gt 0 ]]; do
        case "${1}" in
            -b) broken="true" ; shift ;;
            -v) valid="true" ; shift ;;
            -c) clean="true" ; shift ;;
            *) path="${1}" ; shift ;;
        esac
    done

    validate_required_positional "path" "${path}"
    validate_mutually_exclusive "${broken}" "-b" "${valid}" "-v"

    find "${path}" -type l | while read -r file; do
        if [[ -e "${file}" ]] && [[ -n "${broken}" ]]; then
            continue
        fi

        if [[ ! -e "${file}" ]] && [[ -z "${broken}" ]]; then
            continue
        fi

        [[ -n "${clean}" ]] && echo -n "cleaning "
        echo -n "${file} -> "
        if [[ -f "${file}" ]]; then realpath "${file}" ; else echo "?" ; fi
        [[ -n "${clean}" ]] && echo "unlink ${file}"
    done
}

function hide() {
    local pattern="${1}"

    GLOBIGNORE=".:.."

    for file in "${pattern}"*; do
        if [[ ! "${file}" =~ ^\..*$ ]]; then
            mv -n "$file" ".${file}"
        fi
    done
}

function unhide() {
    local pattern="${1:-}"

    GLOBIGNORE=".:.."

    for file in ".${pattern}"*; do
        mv -n "$file" "${file#.}"
    done
}

function uz() {
    local filename="${1}"
    local wo_extension="${filename%.*}"

    unzip "$filename" -d "${wo_extension}"
}

## filesystem ##################################################################

function nls() {
    # shellcheck disable=SC2012
    ls "${1}" | wc -l
}

function zls() {
    ( zd "${1}" && ls )
}

function znls() {
    # shellcheck disable=SC2012
    ( zd "${1}" && ls | wc -l )
}

function zopen() {
    ( zd "${1}" && open . )
}

## git #########################################################################

function git-root() {
    local git_root
    local submodule_parent

    git_root="$(git rev-parse --show-toplevel)"
    submodule_parent="$(git rev-parse --show-superproject-working-tree)"
    [[ -n "${submodule_parent}" ]] && git_root="${submodule_parent}"

    cd "${git_root}" || exit
}

alias gr="git-root"

function git-ignore() {
    ${EDITOR} "$(git-root)/.gitignore"
}

alias gi="git-ignore"

function clone-external() {
    local repo="${1}"
    local repo_name

    repo_name="$(basename "${repo}")"

    git clone "https://github.com/${repo}" "${EXTERNAL_PKGS}/${repo_name}"
}

## gpg #########################################################################

function gpg-tar-encrypted() {
    local in="${1}"
    local out="${2:-${1}.tar.gz.gpg}"

    tar -cvzf - "${in}" | gpg -c > "${out}"
}

function gpg-decrypt-tar() {
    local in="${1}"

    gpg -d "${in}" | tar -xvzf -
}

function gpg-export() {
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

## nvim ########################################################################

function editor() {
    if [[ -n "$NVIM_LISTEN_ADDRESS" ]]; then
        alias nvim=nvr -cc split --remote-wait +'set bufhidden=wipe'
        export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
        export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    else
        export VISUAL="nvim"
        export EDITOR="nvim"
    fi
}

## scripts #####################################################################

SINGLE_USE_PATH="${BASH_TOOLS}/scripts/single-use"

function __choose-single-use() {
    find "${SINGLE_USE_PATH}" -type f -exec basename {} \; | echo "${SINGLE_USE_PATH}/$(fzf --height=11 -i +m -e)"
}

function single-use() {
    local script="${1:--}"

    if [[ "${script}" == "-" ]]; then
        script="$(find "${SINGLE_USE_PATH}" -type f | fzf --height=11 -i +m -e)"
        shift
    fi

    "${script}" "$@"
}

## system ######################################################################

function inspect-path() {
    echo "${PATH}" | tr ':' '\n'
}

function search-path() {
    local pattern="${1}"
    inspect-path | grep "${pattern}"
}

function profile-sh() {
    PS4='+ $(date "+%s.%N ($LINENO) ")' bash -x "$@"
}

## tmux ########################################################################

## TODO: consolidate these functions and tmux-load-env in a new tool, tmux-env

function tmux-env() {
    local var
    [[ -n "${1+x}" ]] && var="TMUX_$(str::upper "${1}")"

    if [[ $# -eq 0 ]]; then
        tmux show-environment
    elif [[ $# -eq 1 ]]; then
        tmux show-environment "${var}" 2> /dev/null | cut -d "=" -f2
    elif [[ $# -eq 2 ]] && [[ "${2}" == "-c"  ]]; then
        tmux setenv -u "${var}"
    elif [[ $# -eq 2 ]]; then
        tmux setenv "${var}" "${2}"
    else
        ulogger error "tmux-env: zero, one, or two arguments, var_name/var_val, required" -t shell -p util
        return 1
    fi
}

alias txenv="tmux-env"

function tmux-layout() {
    local var
    var="$(tmux display-message -pF '#W')_layout"

    if [[ $# -eq 0 ]]; then
        tmux-env "${var}"
    elif [[ $# -eq 1 ]] && [[ "${1}" == "-c"  ]]; then
        tmux-env "${var}" "-c"
    elif [[ $# -eq 1 ]]; then
        tmux-env "${var}" "${1}"
    else
        ulogger error "tmux-layout: zero or one arguments, layout|-c (clear) expected" -t shell -p util
        return 1
    fi
}

alias txlyt="tmux-layout"

## utils #######################################################################

function sh-pop() {
    tmux-popup bash --dim 90x30 --exit
}

function fz-history() {
    history | fzf-tmux -p
}

function help() {
    if [[ "${1:-}" == "aws" ]]; then
        tmux-popup "$* help | less" --exit
    else
        tmux-popup "$* --help | less" --exit
    fi
}

function man() {
    tmux-popup man "$@" --exit
}

function tldr() {
    tmux-popup tldr "$@" -h 70% --exit
}

## xplr ########################################################################

XPLR="$(which xplr)"

function xplr() {
    while true; do
        XPLR_OUT_PATH="$("${XPLR}")"

        if [[ -z "${XPLR_OUT_PATH}" ]]; then
            return 0
        elif file::is_text "${XPLR_OUT_PATH}"; then
            exec::interactive "Open ${XPLR_OUT_PATH} in ${EDITOR}?" "${EDITOR}" "${XPLR_OUT_PATH}" && "${XPLR}" || return $?
        elif dir::is "${XPLR_OUT_PATH}"; then
            cd "${XPLR_OUT_PATH}" || z "${XPLR_OUT_PATH}" || return $?
        else
            exec::interactive "Open ${XPLR_OUT_PATH}?" "open" "${XPLR_OUT_PATH}"
        fi
    done
}

