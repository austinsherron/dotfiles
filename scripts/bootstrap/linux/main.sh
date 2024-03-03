#!/usr/bin/env bash

set -Eeuo pipefail


## bootstrap linux #############################################################


SCRIPTS_ROOT="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
OS="$(uname | tr '[:upper:]' '[:lower:]')"
OS_SCRIPTS="${SCRIPTS_ROOT}/bootstrap/${OS}"

echo "[INFO] bootstrapping linux"

# install snapd

{ systemctl status snapd &> /dev/null; ERR="$?"; } || true

if [[ "${ERR}" -eq 0 ]]; then
    echo "[INFO] snapd is installed and active"
elif [[ "${ERR}" -eq 4 ]]; then
    echo "[INFO] installing snapd"
    sudo apt install -y snapd
else
    echo "[WARN] snapd is installed but inactive; starting"
    sudo systemctl start snapd
fi

{ systemctl status snapd &> /dev/null; ERR="$?"; } || true

if [[ "${ERR}" -ne 0 ]]; then
    echo "[ERROR] unable to start snapd; exiting"
    exit ${ERR}
fi

# install snap

if ! which snap > /dev/null; then
    echo "[INFO] installing snap"
    sudo apt install -y snap
else
    echo "[INFO] snap already installed"
fi

# install flatpak

if ! which flatpak > /dev/null; then
    echo "[INFO] installing flatpak"
    sudo apt install -y flatpak
else
    echo "[INFO] flatpak already installed"
fi

echo "[INFO] adding flathub repository"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# install 1password/cli

echo "[INFO] [START] installation of 1password and 1password-cli"

"${OS_SCRIPTS}"/1password.sh

echo "[INFO] [END] installation of 1password and 1password-cli"

## install (up-to-date) git

echo "[INFO] [START] installing up-to-date git"

"${OS_SCRIPTS}"/git.sh

echo "[INFO] [END] installing up-to-date git"

## install git-credential-manager

echo "[INFO] [START] installing git-credential-manager"

"${OS_SCRIPTS}"/git-credential-manager.sh

echo "[INFO] [END] installing git-credential-manager"

## install gpg

echo "[INFO] [START] installing gpg"

dpkg -s gpg &> /dev/null || sudo apt install -y gpg

echo "[INFO] [END] installing gpg"

## install pass

echo "[INFO] [START] installing pass"

dpkg -s pass &> /dev/null || sudo apt install -y pass

echo "[INFO] [END] installing pass"

## check for personal gpg key pair

MY_KEY_ID="D55F49224387A57E0FDB80E1494E1B61A3505B41"

if ! gpg --list-keys ${MY_KEY_ID} &> /dev/null; then
    echo "Please import key-pair ${MY_KEY_ID}"
    read -r -n 1 -p "Press any key to continue."
    echo ""
fi

