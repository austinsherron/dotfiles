#!/usr/bin/env bash


## init ########################################################################

# path to the oh-my-bash installation.
export OSH="${EXTERNAL_PKGS}/oh-my-bash"
OSH_PATH="${OSH}/oh-my-bash.sh"

if [[ ! -f "${OSH_PATH}" ]]; then
    ulogger info "no oh-my-bash installation found" -t shell -p rc
    return
fi

## configure ###################################################################

# the completions to load (completions can be found in ~/.oh-my-bash/completions/*);
# NOTE: add wisely, as too many completions slow down shell startup
completions=(
  git
  composer
  ssh
  kubectl
  go
  awscli
  terraform
  tmux
)

# the aliases to load (aliases can be found in ~/.oh-my-bash/aliases/*);
# note: add wisely, as too many aliases slow down shell startup
aliases=(general)

# the plugins to load (plugins can be found in ~/.oh-my-bash/plugins/*);
# note: add wisely, as too many plugins slow down shell startup
plugins=(kubectl)

## load ########################################################################

ulogger info "enabling oh-my-bash" -t shell -p rc
source "${OSH_PATH}"

