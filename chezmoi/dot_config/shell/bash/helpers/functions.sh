#!/usr/bin/env bash

source /etc/profile.d/shared_paths.sh
source "${LOCAL_LIB}/bash/utils.sh"
source "${LOCAL_LIB}/bash/args/validate.sh"


## chezmoi #####################################################################

declare -A CM_ALIASES=([a]=apply [d]=diff)

function cm() {
    if [[ -n "${CM_ALIASES[${1}]+x}" ]]; then
        chezmoi "${CM_ALIASES[${1}]}"
    else
        chezmoi "${@}"
    fi
}

## clipboard ###################################################################

function clip-clear() {
    pbcopy < /dev/null
}

function diff-clip() {
    tmp="$(mktemp)"
    pbpaste >| "${tmp}"
    diff "${tmp}" "${1}" && rm "${tmp}"
}

function pbcf() {
    pbcopy < "${1}"
}

function pbpf() {
    pbpaste > "${1}"
}

function pbpo() {
    pbpaste > "${1}" && ${EDITOR} "${1}"
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
        echo "${file} -> $(realpath "${file}")"
        [[ -n "${clean}" ]] && echo "unlink ${file}"
    done
}

# TODO: parameterize find pattern, create inverse function
function unhide() {
  GLOBIGNORE=".:.."
  for file in .*; do
     mv -n "$file" "${file#.}"
  done
}

function uz() {
  filename="${1}"
  wo_extension="${filename%.*}"

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

## system ######################################################################

function host-id() {
    hostname -s
}

function os-type() {
    uname | tr '[:upper:]' '[:lower:]'
}

function inspect-path() {
    echo "${PATH}" | tr ':' '\n'
}

function search-path() {
    local pattern="${1}"
    inspect-path | grep "${pattern}"
}

## tmux ########################################################################

function tmux-env() {
    local var
    [[ -n "${1+x}" ]] && var="TMUX_$(to_upper "${1}")"

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

