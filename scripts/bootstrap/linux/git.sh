#!/usr/bin/env bash

set -Eeuo pipefail

# source: https://git-scm.com/download/linux


# NOTE: this is duplicated from the scripts repo: we need to install up-to-date git to
# clone that repo

echo  "[INFO] adding git-core apt repo"
VERSION="2.43.0"

if [[ "$(git --version | awk '{print $3}')" = "${VERSION}" ]]; then
    echo "git already installed at version ${VERSION}; exiting"
    exit 0
fi

sudo add-apt-repository ppa:git-core/ppa

echo  "[INFO] installing git"
sudo apt update && sudo apt install git

