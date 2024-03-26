#!/usr/bin/env bash

set -Eeuo pipefail

# source: https://git-scm.com/download/linux


# NOTE: this is duplicated from the scripts repo: we need to install up-to-date git to
# clone that repo

ulogger info "adding git-core apt repo"
VERSION="2.43.0"

if [[ "$(git --version | awk '{print $3}')" = "${VERSION}" ]]; then
    ulogger info "git already installed at version ${VERSION}; exiting"
    exit 0
fi

sudo add-apt-repository ppa:git-core/ppa

ulogger info "installing git"
sudo apt update && sudo apt install git

