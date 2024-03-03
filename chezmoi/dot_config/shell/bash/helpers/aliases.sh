#!/usr/bin/env bash


## rename ######################################################################

alias c="clear"
alias db="dropbox"
alias g="git"
alias nv="nvim"
alias spt="spotify_player"
alias tk="task"
alias tkui="taskwarrior-tui"
alias tx="tmux"
alias vi="/usr/bin/vim"
alias vim="nvim"
alias wtf="wtfutil"
alias zd="z"
alias zx="zoxide"

## config ######################################################################

## reload

alias rcload="source ${RC}"
alias txload="tmux source-file ${TMUX_CONF_PUB}"

## deploy (chezmoi) + reload

# diff
alias diff-dot="chezmoi diff"
alias dfdot="diff-dot"
alias dfd="dfdot"

# deploy
alias deploy-dot="chezmoi diff && chezmoi apply && rcload && txload"
alias deploy-dot-force="chezmoi apply && rcload && txload"
alias dpdot="deploy-dot"
alias dpdotf="deploy-dot-force"
alias dpd="dpdot"
alias dpdf="dpdotf"

### edit

## shell + tmux

alias rc="${EDITOR} ${RC}; rcload"
alias txrc="${EDITOR} ${TMUX_CONF}; txload"

## editors

alias nvrc="${EDITOR} ${NVIM_ROOT_PUB}/init.lua"
alias vrc="${EDITOR} ${LEGACY_CONFIG_ROOT_PUB}/.vimrc"

## misc (task, git, hyper, kube)

alias tkrc="${EDITOR} ${CONFIG_ROOT_PUB}/task/taskrc"
alias gc="${EDITOR} ${LEGACY_CONFIG_ROOT_PUB}/.gitconfig"
alias kubec="${EDITOR} ${LEGACY_CONFIG_ROOT_PUB}/.kube/config"

## utils #######################################################################

### appearance

alias gogh='bash -c "$(wget -qO- https://git.io/vQgMr)"'

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
alias gh-pr-view="gh pr view ${1}"

## repos

alias gh-repo-ls="gh repo ls --no-archived"

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
function help() { tmux-cmd-popup "${1} --help"; }
function man() { tmux-cmd-popup "man ${1}"; }
function tldr() { tmux-cmd-popup "tldr ${1}" -h 70%; }

