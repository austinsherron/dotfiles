#!/usr/bin/env bash

set -Eeuo pipefail


## dotfiles installation ######################################################

export ULOGGER_TYPE="install"
export ULOGGER_PREFIX="chezmoi"

DOTFILES="$(dirname "$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )")"

## run os agnostic bootstrap script

"${DOTFILES}/scripts/bootstrap/common.sh" "$@"

## run os specific bootstrap script

OS="$(uname | tr '[:upper:]' '[:lower:]')"

"${DOTFILES}/scripts/bootstrap/${OS}/main.sh"

## install chezmoi config

CONFIG_ROOT="${HOME}/.config"

CHEZMOI_SRC="${DOTFILES}/chezmoi"
CHEZMOI_DST="${CONFIG_ROOT}/chezmoi"

CHEZMOI_TOML_SRC="${CHEZMOI_SRC}/dot_config/chezmoi/chezmoi.toml"
CHEZMOI_TOML_DST="${CHEZMOI_DST}/chezmoi.toml"

if [[ ! -d "${CHEZMOI_DST}" ]]; then
    ulogger info " creating ${CHEZMOI_DST} dir"
    mkdir "${CHEZMOI_DST}"
else
    ulogger info "${CHEZMOI_DST} dir already exists"
fi

if [[ ! -f "${CHEZMOI_TOML_DST}" ]]; then
    ulogger info "copying ${CHEZMOI_TOML_SRC} to ${CHEZMOI_TOML_DST}"
    cp "${CHEZMOI_TOML_SRC}" "${CHEZMOI_TOML_DST}"
else
    ulogger info "${CHEZMOI_TOML_DST} already exists"
fi

## apply chezmoi

chezmoi apply

## load configuration

source "${HOME}/.bash_profile"
tmux source-file "${CONFIG_ROOT}/tmux/tmux.conf"

