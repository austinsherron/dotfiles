#!/usr/bin/env bash

set -Eeuo pipefail


BASH_TOOLS_REPO="https://github.com/austinsherron/bash-tools"
BASH_TOOLS="${HOME}/Workspace/workspace/bash-tools"
TOOLS_ROOT="${BASH_TOOLS}/tools"


## save persistent hostname

CUSTOM_HOSTNAME="${1:-"$(hostname -s)"}"

sudo mkdir -p /usr/local/etc

if [[ ! -f /usr/local/etc/hostname ]]; then
    echo "[INFO] saving persistent hostname=${CUSTOM_HOSTNAME} to /usr/local/etc"
    sudo echo "${CUSTOM_HOSTNAME}" >| /usr/local/etc/hostname
fi

# install bash-tools

if [[ -d "${BASH_TOOLS}" ]]; then
    echo "[INFO] bash-tools repo already exists"
else
    echo "[INFO] bash-tools repo doesn't exist; cloning ${BASH_TOOLS_REPO} to ${BASH_TOOLS}"
    mkdir -p "${BASH_TOOLS}"
    git clone https://github.com/austinsherron/bash-tools "${BASH_TOOLS}"
fi

ulogger info "installing bash-tools"
"${TOOLS_ROOT}/install/install.sh"

if ! which ulogger &> /dev/null; then
    echo "[ERROR] ulogger is not installed after bootstrapping tools; something is wrong..."
    exit 1
fi

ulogger info "tools repo installed"

