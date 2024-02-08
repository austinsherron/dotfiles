#!/usr/bin/env bash

set -Eeuo pipefail


## bootstrap linux #############################################################

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

echo "[INFO] bootstrapping linux"

# install snapd

{ systemctl status snapd &> /dev/null; ERR="$?"; } || true

if [[ "${ERR}" -eq 0 ]] in
    echo "[INFO] snapd is installed and active"
elif [[ "${ERR}" -eq 4 ]]
    echo "[INFO] installing snapd"
    sudo apt install snapd
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
    sudo apt install snap
else
    echo "[INFO] snap already installed"
fi

# install flatpak

if ! which flatpak > /dev/null; then
    echo "[INFO] installing flatpak"
    sudo apt install flatpak
else
    echo "[INFO] flatpak already installed"
fi

echo "[INFO] adding flathub repository"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# install 1password/cli

echo "[INFO] [START] installation of 1password and 1password-cli"

source "${SCRIPT_PATH}/1password.sh"

echo "[INFO] [END] installation of 1password and 1password-cli"

## install (up-to-date) git

echo "[INFO] [START] installing up-to-date git"

source "${SCRIPT_PATH}/git.sh"

echo "[INFO] [END] installing up-to-date git"

