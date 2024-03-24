#!/usr/bin/env bash

set -Eeuo pipefail


TOOLS_REPO="https://github.com/austinsherron/tools"
TOOLS_ROOT="${HOME}/Workspace/workspace/tools"

if [[ ! -d "${TOOLS_ROOT}" ]]; then
    echo "[INFO] tools repo doesn't exist; cloning ${TOOLS_REPO} to ${TOOLS_ROOT}"

    mkdir -p "${TOOLS_ROOT}"
    git clone https://github.com/austinsherron/tools "${TOOLS_ROOT}"
else
    echo "[INFO] tools repo already exists"
fi


echo "[INFO] installing tools"

"${TOOLS_INSTALL}/tools/install/install.sh"

if ! ulogger; then
    echo "[ERROR] ulogger is not installed after bootstrapping tools; something is wrong..."
    exit 1
fi

ulogger info "tools repo installed"

