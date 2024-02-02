#!/usr/bin/env bash


### 1password ##################################################################

op-get() {
    if [[ $# -lt 2 ]]; then
        echo "op-get: item and field are required"
        return 1
    fi

    local item="${1}"
    local field="${2}"

    op item get "${item}" --field label="${field}"
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
    cat "${1}" | pbcopy
}

pbpf() {
    pbpaste > "${1}"
}

pbpo() {
    pbpaste > "${1}" && ${EDITOR} "${1}"
}

## files #######################################################################

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
    local repo_name="$(basename "${repo}")"

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

