#!/usr/bin/env bash

set -Eeuo pipefail

# source: https://git-scm.com/download/linux


# NOTE: this is duplicated from the scripts repo: we need to install up-to-date git to
# clone that repo

echo  "[INFO] adding git-core apt repo"
sudo add-apt-repository ppa:git-core/ppa

echo  "[INFO] installing git"
sudo apt update && sudo apt install git

