#!/usr/bin/env bash

set -Eeuo pipefail


TOOLS_REPO="https://github.com/austinsherron/tools"
TOOLS_ROOT="${HOME}/Workspace/workspace/tools"
TOOLS_BOOTSTRAP="${TOOLS_ROOT}/install/bootstrap.sh"

if [[ ! -d "${TOOLS_ROOT}" ]]; then
    echo "[INFO] tools repo already exists"
    exit 0
fi

echo "[INFO] tools repo doesn't exist; cloning ${TOOLS_REPO} to ${TOOLS_ROOT}"

mkdir -p "${HOME}/Workspace/workspace/tools"
git clone https://github.com/austinsherron/tools tools

echo "[INFO] bootstrapping tools"

"${TOOLS_BOOTSTRAP}"

if ! ulogger; then
    echo "[ERROR] ulogger is not installed after bootstrapping tools; something is wrong..."
    exit 1
fi

ulogger info "tools repo bootstrapped"

