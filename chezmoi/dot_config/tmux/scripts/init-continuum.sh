#!/usr/bin/env bash

set -Eeuo pipefail

source "${BASH_LIB}/args/parse.sh"


help() {
cat <<help
DESCRIPTION

    Script that implements a workaround for install tmux-continuum session save hooks.

    tmux 3.6+ interprets #() in set-option from run-shell, preventing tmux-continuum from adding its save hook to status-right via TPM. Add it with this script so tmux stores the literal #() format string.

USAGE

    Call from tmux.conf after install tmux-resurrect and tmux-continuum plugins.

help
}


if [[ $# -eq 1 ]] && parse::is_help_flag "${1}"; then
    help && exit 0
elif [[ $# -gt 0 ]]; then
    help && exit 1
fi

if tmux show-option -gqv status-right | grep -q continuum_save; then
    exit 0
fi


CONTINUUM_SAVE="${TMUX_ROOT_PUB}/plugins/tmux-continuum/scripts/continuum_save.sh"
STATUS_RIGHT="$(tmux show-option -gqv status-right)"

tmux set-option -g status-right "#(${CONTINUUM_SAVE})${STATUS_RIGHT}"

