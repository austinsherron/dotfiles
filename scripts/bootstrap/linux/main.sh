#!/usr/bin/env bash

set -Eeuo pipefail


## bootstrap linux #############################################################


SCRIPTS_ROOT="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
OS="$(uname | tr '[:upper:]' '[:lower:]')"
OS_SCRIPTS="${SCRIPTS_ROOT}/bootstrap/${OS}"

ulogger info "bootstrapping linux"

# install snapd

{ systemctl status snapd &> /dev/null; ERR="$?"; } || true

if [[ "${ERR}" -eq 0 ]]; then
    ulogger info "snapd is installed and active"
elif [[ "${ERR}" -eq 4 ]]; then
    ulogger info "installing snapd"
    sudo apt install -y snapd
else
    ulogger warn "snapd is installed but inactive; starting"
    sudo systemctl start snapd
fi

{ systemctl status snapd &> /dev/null; ERR="$?"; } || true

if [[ "${ERR}" -ne 0 ]]; then
    ulogger error "unable to start snapd; exiting"
    exit ${ERR}
fi

# install snap

if ! which snap > /dev/null; then
    ulogger info "installing snap"
    sudo apt install -y snap
else
    ulogger info "snap already installed"
fi

# install flatpak

if ! which flatpak > /dev/null; then
    ulogger info "installing flatpak"
    sudo apt install -y flatpak
else
    ulogger info "flatpak already installed"
fi

ulogger info "adding flathub repository"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# install 1password/cli

ulogger info "[START] installation of 1password and 1password-cli"

"${OS_SCRIPTS}"/1password.sh

ulogger info "[END] installation of 1password and 1password-cli"

## install (up-to-date) git

ulogger info "[START] installing up-to-date git"

"${OS_SCRIPTS}"/git.sh

ulogger info "[END] installing up-to-date git"

## install git-credential-manager

ulogger info "[START] installing git-credential-manager"

"${OS_SCRIPTS}"/git-credential-manager.sh

ulogger info "[END] installing git-credential-manager"

## install gpg

ulogger info "[START] installing gpg"

dpkg -s gpg &> /dev/null || sudo apt install -y gpg

ulogger info "[END] installing gpg"

## install pass

ulogger info "[START] installing pass"

dpkg -s pass &> /dev/null || sudo apt install -y pass

ulogger info "[END] installing pass"

## check for personal gpg key pair

MY_KEY_ID="D55F49224387A57E0FDB80E1494E1B61A3505B41"

if ! gpg --list-keys ${MY_KEY_ID} &> /dev/null; then
    ulogger "Please import key-pair ${MY_KEY_ID}"
    read -r -n 1 -p "Press any key to continue."
    ulogger ""
fi

