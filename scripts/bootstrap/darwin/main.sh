#!/usr/bin/env bash

set -Eeuo pipefail


## bootstrap macos #############################################################

echo "[INFO] bootstrapping darwin"

# install homebrew

if ! which brew > /dev/null; then
    echo "[INFO] installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "[INFO] homebrew already installed"
fi

# update path

BREW="$(brew --prefix)"
BREW_BIN="${BREW}/bin"

echo "[INFO] adding ${BREW}:${BREW_BIN} to PATH"
export PATH="${BREW}:${BREW_BIN}:${PATH}"

# install 1password/cli

if [[ ! -d "/Applications/1Password.app" ]]; then
    echo "[INFO] installing 1password"
    brew install --cask 1password
else
    echo "[INFO] 1password already installed"
fi

if ! which op > /dev/null; then
    echo "[INFO] installing 1password-cli"
    brew install --cask 1password-cli
else
    echo "[INFO] 1password-cli already installed"
fi

## install chezmoi

if ! which chezmoi > /dev/null; then
    echo "[INFO] installing chezmoi"
    brew install chezmoi
else
    echo "[INFO] chezmoi already installed"
fi

## install (up-to-date) git

echo "[INFO] installing up-to-date git"
brew install git

