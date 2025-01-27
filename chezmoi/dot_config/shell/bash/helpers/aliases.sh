#!/usr/bin/env bash
# shellcheck disable=SC2139


## rename ######################################################################

alias c="clear"
alias db="dbxcli"
alias g="git"
alias ls="lsd --group-directories-first"
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

# NOTE: diff is primarily configured via gitconfig, i.e.: dotfiles:chezmoi/dot_gitconfig
alias diff="delta"
# TODO: check for analogous delta flags
# alias diffr="diff -r"
# alias diffw="diff -w"

### copy/paste

alias pbp="clipctl paste"
alias pbc="clipctl copy"
alias pbcf="clipctl copy --file"
alias pbpf="clipctl paste --file"
alias pbpo="clipctl paste --open --file"
alias clip-clear="clipctl clear"
alias diff-clip="clipctl diff --file"

### github

## prs

alias gh-pr-create="gh pr create -a \"@me\""
alias gh-pr-ls="gh pr ls --author \"@me\""
alias gh-pr-todo="gh pr ls --search 'is:open is:pr review-requested:austinsherron archived:false'"
alias gh-pr-view="gh pr view"

## repos

alias gh-repo-ls="gh repo ls --no-archived"

### logs

# explore
alias logls="ulogger list"
alias tlog="ulogger tree"

# verbosity
alias lv="LogFlags::set_verbosity_flag"

# env
alias lre="LogEnv::read"
alias lse="LogEnv::set"
alias lce="LogEnv::clear"

# view/edit
alias vl="ulogger edit"

### repls

alias hs-pop="tmux-cmd-popup \"hs\""
alias lua-pop="tmux-cmd-popup \"lua\""
alias py-pop="tmux-cmd-popup \"python3\""

### search

alias brv="s -p brave -b brave-browser"
alias ddg="s -p duckduckgo"
alias goog="s -p google -b google-chrome"
alias qwnt="s -p qwant -b brave-browser"
alias sp="s -p startpage -b brave-browser"
alias srx="s -p searxng -b brave-browser"
alias sanon="s -p google -b brave-browser-private"

### un*

alias una="unalias"
alias unf="unset -f"
alias uns="unset"

