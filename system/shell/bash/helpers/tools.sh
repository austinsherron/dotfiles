#!/usr/bin/env bash


## neovim ######################################################################

export NEOVIM_LOG_LEVEL="DEBUG"
export NEOVIM_NOTIFY_LEVEL="INFO"
export NEOVIM_AUTO_INSTALL_PACKAGES=true

## nix #########################################################################

if [ -e /home/austin/.nix-profile/etc/profile.d/nix.sh ]; then
    . /home/austin/.nix-profile/etc/profile.d/nix.sh;
fi

## nvm ########################################################################

export NVM_DIR="${LEGACY_CONFIG_ROOT_PUB}/.nvm"

[ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"                    # load nvm
[ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion"  # load completions

## zoxide ######################################################################

if which zoxide > /dev/null 2>&1; then
    eval "$(zoxide init bash)"
fi

