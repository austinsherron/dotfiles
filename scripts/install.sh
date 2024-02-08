#!/usr/bin/env bash

set -Eeuo pipefail


## dotfiles installation ######################################################

## run os specific bootstrap script

DOTFILES="$(dirname $( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P ))"

OS="$(uname | tr '[:upper:]' '[:lower:]')"
source "${DOTFILES}/scripts/bootstrap/${OS}/main.sh"

## install chezmoi config

CONFIG_ROOT="${HOME}/.config"

CHEZMOI_SRC="${DOTFILES}/chezmoi"
CHEZMOI_DST="${CONFIG_ROOT}/chezmoi"

CHEZMOI_TOML_SRC="${CHEZMOI_SRC}/dot_config/chezmoi/chezmoi.toml"
CHEZMOI_TOML_DST="${CHEZMOI_DST}/chezmoi.toml"

if [[ ! -d "${CHEZMOI_DST}" ]]; then
    echo "[INFO] creating ${CHEZMOI_DST}"
    mkdir "${CHEZMOI_DST}"
fi

if [[ ! -f "${CHEZMOI_TOML_DST}" ]]; then
    echo "[INFO] copying ${CHEZMOI_TOML_SRC} to ${CHEZMOI_TOML_DST}"
    cp "${CHEZMOI_TOML_SRC}" "${CHEZMOI_TOML_DST}"
fi

## apply chezmoi

chezmoi apply

## load configuration

source "${HOME}/.bash_profile"
tmux source-file "${CONFIG_ROOT}/tmux/tmux.conf"

