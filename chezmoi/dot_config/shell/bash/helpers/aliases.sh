#!/usr/bin/env bash
# shellcheck disable=SC2139


## rename ######################################################################

alias c="clear"
alias db="dropbox"
alias g="git"
alias ls="lsd"
alias nv="nvim"
alias pm="pkgmgr"
alias pop="tmux-popup"
alias spt="spotify_player"
alias tk="task"
alias tkui="taskwarrior-tui"
alias tx="tmux"
alias ulog="ulogger"
alias vi="/usr/bin/vim"
alias vim="nvim"
alias wtf="wtfutil"
alias zd="z"
alias zx="zoxide"

## config ######################################################################

## reload

alias pfload="source \"${PROFILE}\""
alias rcload="source \"${RC}\""
alias txload="tmux source-file ${TMUX_CONF_PUB}"

## deploy (chezmoi) + reload

# diff
alias diff-dot="chezmoi diff"
alias dfdot="diff-dot"
alias dfd="dfdot"

# deploy
alias deploy-dot="diff-dot && chezmoi apply && rcload && txload"
alias deploy-dot-force="chezmoi apply && rcload && txload"
alias dpdot="deploy-dot"
alias dpdotf="deploy-dot-force"
alias dpd="dpdot"
alias dpdf="dpdotf"

## misc (task, git, hyper, kube)

alias tkrc="${EDITOR} ${CONFIG_ROOT_PUB}/task/taskrc"
alias gc="${EDITOR} ${LEGACY_CONFIG_ROOT_PUB}/.gitconfig"
alias kubec="${EDITOR} ${LEGACY_CONFIG_ROOT_PUB}/.kube/config"

## utils #######################################################################

### appearance

alias gogh='bash -c "$(wget -qO- https://git.io/vQgMr)"'

### ble.sh

alias ba="ble-attach"
alias bd="ble-detach"

### diff

alias diff="colordiff -N -u"
alias diffr="diff -r"
alias diffw="diff -w"

### copy/paste

alias pbc="pbcopy"
alias pbp="pbpaste"

### github

## prs

alias gh-pr-create="gh pr create -a \"@me\""
alias gh-pr-ls="gh pr ls --author \"@me\""
alias gh-pr-todo="gh pr ls --search 'is:open is:pr review-requested:austinsherron archived:false'"
alias gh-pr-view="gh pr view"

## repos

alias gh-repo-ls="gh repo ls --no-archived"

### logs

alias vl="ulogger edit"
alias logls="ulogger list"

### repls

alias hs-pop="tmux-cmd-popup \"hs\""
alias lua-pop="tmux-cmd-popup \"lua\""
alias py-pop="tmux-cmd-popup \"python3\""

### search

alias brv="s -p searxng"
alias ddg="s -p duckduckgo"
alias goog="s -p google"
alias qwnt="s -p qwant"
alias sp="s -p startpage"
alias srx="s -p searxng"
alias sanon="s -p google -b \"chromium --incognito\""

## alias functions #############################################################

### informational

function fz-history() { history | fzf-tmux -p; }
function help() { tmux-popup "$* --help | less" --exit ; }
function man() { tmux-popup man "$@" --exit ; }
function tldr() { tmux-popup tldr "$@" -h 70% --exit ; }

