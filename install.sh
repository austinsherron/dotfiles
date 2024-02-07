#!/usr/bin/env bash

set -Eeuo pipefail


# dotfiles installation script

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
CONFIG_ROOT="${HOME}/.config"
CHEZMOI_DIR="${CONFIG_ROOT}/chezmoi"
CHEZMOI_TOML_SRC="${SCRIPT_PATH}/dot_config/chezmoi/chezmoi.toml"
CHEZMOI_TOML_TGT="${CHEZMOI_DIR}/chezmoi.toml"

if ! which chezmoi > /dev/null; then
    echo "[INFO] installing chezmoi"
    sh -c "$(curl -fsLS get.chezmoi.io)"
fi

if [[ ! -d "${CHEZMOI_DIR}" ]]; then
    echo "[INFO] creating ${CHEZMOI_DIR}"
    mkdir "${CHEZMOI_DIR}"
fi

if [[ ! -f "${CHEZMOI_TOML_TGT}" ]]; then
    echo "[INFO] copying ${CHEZMOI_TOML_SRC} to ${CHEZMOI_TOML_TGT}"
    cp "${CHEZMOI_TOML_SRC}" "${CHEZMOI_TOML_TGT}"
fi

chezmoi apply

source "${HOME}/.bash_profile"
tmux source-file "${CONFIG_ROOT}/tmux/tmux.conf"

