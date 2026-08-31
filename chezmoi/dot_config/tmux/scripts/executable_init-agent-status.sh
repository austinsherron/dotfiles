#!/usr/bin/env bash

set -Eeuo pipefail

source "${BASH_LIB}/args/parse.sh"


help() {
cat <<help
DESCRIPTION

    Wires the agent status indicator (see: tmux-agent-status) into the theme's
    status bar. Three steps, all idempotent:

      * readies the state stores for the running server, dropping any left over
        from a previous one (pane ids are only unique w/in a server)

      * splices the state's colors into the window status formats, one hook per
        "#[...]" run the theme opens, so a flagged window's colors are overridden
        by the state's and everything else is left exactly as the theme drew it.
        A powerline theme shapes a window entry out of separator glyphs, and those
        are as much the entry as the text is, so each gets a hook of its own:

            #{@agent_edge_in}    the glyph leading into the entry
            #{@agent_style}      the entry's body
            #{@agent_edge_out}   the glyph trailing out of it

      * prepends an indicator to status-right: one chip per *other* session that
        holds flagged panes, naming it, counting them and wearing the color of
        the loudest. It doubles as the sweep, running on the status-interval to
        prune panes that have died and re-color windows whose panes have moved

    The indicator is a #() format string, which tmux 3.6+ interprets #() in
    set-option run inline from run-shell, so it must be injected from a script
    that re-sets status-right so tmux stores the literal #() format string.

USAGE

    Call from tmux.conf after the theme has set the window status formats and
    tmux-continuum has set status-right (i.e.: after init-continuum.sh).

help
}


if [[ $# -eq 1 ]] && parse::is_help_flag "${1}"; then
    help && exit 0
elif [[ $# -gt 0 ]]; then
    help && exit 1
fi

# the window-local options tmux-agent-status paints
BODY_FMT='#{@agent_style}'
EDGE_IN_FMT='#{@agent_edge_in}'
EDGE_OUT_FMT='#{@agent_edge_out}'
# the segment naming every other session that holds flagged panes. It sweeps
# before it prints--pruning dead panes and re-coloring windows whose panes have
# moved--so one #() does both jobs and the counts/colors it shows come from a 
# single read.
#
# "#{client_session}" is expanded by tmux before the command runs, so each client
# is told which session it's looking at and gets a cached run of its own. Quoted
# because a session name may contain spaces
STATUS_FMT='#(ULOGGER_DISABLED="true" tmux-agent-status status "#{client_session}")'

# styling delimiters
STYLE_OPEN='#['
STYLE_CLOSE=']'
# the seam between a window entry's styling and its text
SEAM="${STYLE_CLOSE} #I"


function _init_stores() {
    ULOGGER_DISABLED="true" tmux-agent-status init
}

function _has_styling() {
    local fmt="${1}"
    [[ "${fmt}" == *"${STYLE_OPEN}"* ]]
}

function _has_body() {
    local fmt="${1}"
    [[ "${fmt}" == *"${BODY_FMT}"* ]]
}

function _set_body_idempotently() {
    local fmt="${1}"
    local opt="${2}"

    _has_body "${fmt}" || tmux set-option -gw "${opt}" "${BODY_FMT}${fmt}"
}

function _validate_styling() {
    local fmt="${1}"
    local opt="${2}"

    if [[ "${fmt}" != *"${SEAM}"* ]]; then
        tmux display-message "agent-status: can't splice into ${opt}; unrecognized format"
        return 1
    fi

    return 0
}

function _inject_body() {
    local fmt="${1}"
    local -r repl="${STYLE_CLOSE}${BODY_FMT} #I"
    printf '%s\n' "${fmt/"${SEAM}"/"${repl}"}"
}

function _inject_body_idempotently() {
    local fmt="${1}"
    local opt="${2}"

    # each hook guards itself, so a format that was spliced by an older version of
    # this script picks up whatever it's missing rather than being skipped whole
    if ! _has_body "${fmt}" ; then
        _validate_styling "${fmt}" "${opt}" || return 1
        fmt="$(_inject_body "${fmt}")"
    fi

    printf '%s\n' "${fmt}"
}

function _inject_edge_in() {
    local fmt="${1}"
    local pre rest run

    pre="${fmt%%"${STYLE_OPEN}"*}"
    rest="${fmt#"${pre}"}"
    run="${rest%%"${STYLE_CLOSE}"*}${STYLE_CLOSE}"

    printf '%s\n' "${pre}${run}${EDGE_IN_FMT}${rest#"${run}"}"
}

function _inject_edge_out() {
    local fmt="${1}"
    local head rest run

    rest="${fmt##*"${STYLE_OPEN}"}"
    run="${rest%%"${STYLE_CLOSE}"*}${STYLE_CLOSE}"
    head="${fmt%"${rest}"}"

    printf '%s\n' "${head}${run}${EDGE_OUT_FMT}${rest#"${run}"}"
}

function _inject_edges_idempotently() {
    local fmt="${1}"

    [[ "${fmt}" == *"${EDGE_IN_FMT}"* ]] || fmt="$(_inject_edge_in "${fmt}")"
    [[ "${fmt}" == *"${EDGE_OUT_FMT}"* ]] || fmt="$(_inject_edge_out "${fmt}")"

    printf '%s\n' "${fmt}"
}

function _splice_window_format() {
    local -r opt="${1}"
    local fmt ; fmt="$(tmux show-option -gqv "${opt}")"

    # a format that does no styling of its own
    if ! _has_styling "${fmt}"; then
        _set_body_idempotently "${fmt}" "${opt}"
        return 0
    fi

    fmt="$(_inject_body_idempotently "${fmt}" "${opt}")" || return 0
    fmt="$(_inject_edges_idempotently "${fmt}")"
    tmux set-option -gw "${opt}" "${fmt}"
}

function _splice_status() {
    local right ; right="$(tmux show-option -gqv status-right)"

    [[ "${right}" == *"${STATUS_FMT}"* ]] && return 0
    tmux set-option -g status-right "${STATUS_FMT}${right}"
}


## main

_init_stores
_splice_window_format window-status-format
_splice_window_format window-status-current-format
_splice_status
