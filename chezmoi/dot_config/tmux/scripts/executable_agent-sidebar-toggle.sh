#!/usr/bin/env bash

set -Eeuo pipefail

source "${BASH_LIB}/args/parse.sh"
source "${BASH_LIB}/args/validate.sh"


help() {
cat <<help
DESCRIPTION

    Wrapper around tmux-agent-sidebar's "toggle"/"toggle-all" that preserves the
    window's layout across a toggle.

    The plugin opens the sidebar with a bare "split-window" and closes it with a
    bare "kill-pane" (see: its src/cli/toggle.rs), neither of which touches the
    window layout. tmux redistributes the reclaimed space by its own rules, so a
    layout set via tmux-resize-pane/tmux-resize-layout doesn't survive the round
    trip. Stash the layout in @sidebar_saved_layout before the split, then
    re-select it after the kill.

USAGE

    agent-sidebar-toggle.sh toggle <window-id> <pane-path>
    agent-sidebar-toggle.sh toggle-all

help
}


if [[ $# -eq 0 ]] || { [[ $# -eq 1 ]] && parse::is_help_flag "${1}"; }; then
    help && exit 0
fi

readonly LAYOUT_OPT="@sidebar_saved_layout"

SIDEBAR_BIN="$(tmux show-option -gqv @agent_sidebar_bin)"
readonly SIDEBAR_BIN

WINDOW="${2:-}"
PANE_PATH="${3:-}"

# ids of the windows that currently hold a sidebar pane
function _sidebar_windows() {
    tmux list-panes -a -F "#{window_id} #{@pane_role}" \
        | awk '$2 == "sidebar" { print $1 }' \
        | sort -u
}

function _save_layout() {
    local window="${1}" layout

    layout="$(tmux display-message -p -t "${window}" "#{window_layout}")"
    tmux set-option -w -t "${window}" "${LAYOUT_OPT}" "${layout}"
}

# NOTE: best-effort by design--a stashed layout only applies if the window
# still holds the panes it held when the sidebar opened, so a pane opened or
# closed while the sidebar was up leaves tmux to lay the window out itself
function _restore_layout() {
    local window="${1}" layout

    layout="$(tmux show-option -wqv -t "${window}" "${LAYOUT_OPT}")"
    [[ -z "${layout}" ]] && return 0

    tmux select-layout -t "${window}" "${layout}" 2>/dev/null || true
    tmux set-option -wu -t "${window}" "${LAYOUT_OPT}" 2>/dev/null || true
}

function _toggle_one() {
    validate_required_positional "window" "${WINDOW}"

    if _sidebar_windows | grep -qx "${WINDOW}"; then
        "${SIDEBAR_BIN}" toggle "${WINDOW}" "${PANE_PATH}"
        _restore_layout "${WINDOW}"
    else
        _save_layout "${WINDOW}"
        "${SIDEBAR_BIN}" toggle "${WINDOW}" "${PANE_PATH}"
    fi
}

function _toggle_all() {
    mapfile -t windows < <(_sidebar_windows)

    if [[ "${#windows[@]}" -gt 0 ]]; then
        "${SIDEBAR_BIN}" toggle-all

        for window in "${windows[@]}"; do
            _restore_layout "${window}"
        done
    else
        mapfile -t windows < <(tmux list-windows -a -F "#{window_id}")

        for window in "${windows[@]}"; do
            _save_layout "${window}"
        done

        "${SIDEBAR_BIN}" toggle-all
    fi
}


## main

case "${1}" in
    toggle) _toggle_one ;;
    toggle-all) _toggle_all ;;
    *) help && exit 1 ;;
esac
