#!/usr/bin/env bash

set -Eeuo pipefail


## bootstrap macos #############################################################

ulogger info "bootstrapping darwin"

# install homebrew

if ! which brew > /dev/null; then
    ulogger info "installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    ulogger info "homebrew already installed"
fi

# update path

BREW="$(brew --prefix)"
BREW_BIN="${BREW}/bin"

ulogger info "adding ${BREW}:${BREW_BIN} to PATH"
export PATH="${BREW}:${BREW_BIN}:${PATH}"

# install 1password/cli

if [[ ! -d "/Applications/1Password.app" ]]; then
    ulogger info "installing 1password"
    brew install --cask 1password
else
    ulogger info "1password already installed"
fi

if ! which op > /dev/null; then
    ulogger info "installing 1password-cli"
    brew install --cask 1password-cli
else
    ulogger info "1password-cli already installed"
fi

## install chezmoi

if ! which chezmoi > /dev/null; then
    ulogger info "installing chezmoi"
    brew install chezmoi
else
    ulogger info "chezmoi already installed"
fi

## install (up-to-date) git

ulogger info "installing up-to-date git"
brew install git

