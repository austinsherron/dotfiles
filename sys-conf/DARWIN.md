# MacOS Setup

## OS Settings

- [ ] Tap to click
- [ ] Turn off natural scrolling
- [ ] Keyboard shortcuts
- [ ] Turn off desktop click
- [ ] Turn on disk encryption (FileVault)
- [ ] Turn on firewall
- [ ] Customize screensaver/sleep time 
- [ ] Change dragging style to "With Drag Lock"
- [ ] Grant full disk access to iTerm2

## App Config

### Chrome

#### Extensions

 - [ ] 1Password
 - [ ] Vimium

### Librewolf

- [ ] Copy ~/.librewolf/austins-default.main to /Users/austin/Library/Application\ Support/librewolf/Profiles
    - [ ] Also may need to update profiles.ini to use the right profile

## Installs

### Apps

Note: these can all be installed w/ homebrew casks.

- [ ] Docker Desktop

### Homebrew

Installed manually from website.

#### Taps

- [ ] homebrew/cask-fonts

#### Packages

##### Personal

- [ ] 1password (`--cask`)
- [ ] amethyst (`--cask`)
- [ ] bash (configure shell manually w/ newer bash version)
- [ ] bash-completion
- [ ] bat
- [ ] bazecor (`--cask`)
- [ ] brave-browser (`--cask`)
- [ ] chezmoi
- [ ] colordiff
- [ ] dropbox (`--cask`)
- [ ] fzf
- [ ] gawk
- [ ] google-chrome
- [ ] grep
- [ ] gh
- [ ] gpg
- [ ] gsed
- [ ] iterm2 (`--cask`)
- [ ] jq
- [ ] lazygit
- [ ] librewolf (`--cask --no-quarantine`)
- [ ] lua
- [ ] luarocks
- [ ] openshot-video-editor (`--cask`)
- [ ] neovim
- [ ] npm
- [ ] nvr
- [ ] pinentry
- [ ] rg
- [ ] rust (cargo)
- [ ] qutebrowser (`--cask`)
- [ ] s-search
- [ ] starship
- [ ] stow
- [ ] tor-browser (`--cask`) 
- [ ] tmux 
- [ ] wget
- [ ] whatsapp (`--cask`)
- [ ] yubico-authenticator (`--cask`)
- [ ] yubico-yubikey-manager (`--cask`)
- [ ] zoxide 

##### Work

- [ ] coreutils
- [ ] docker
- [ ] golang
- [ ] helm
- [ ] helmfile
- [ ] kubectl
- [ ] protoc

### Personal Repos

- [ ] dotfiles
- [ ] lib
- [ ] nvim
- [ ] scripts
- [ ] tools

### Fonts

- [ ] JetBrainsMono Nerd Font (manually installed, but can use homebrew)

## Env Config/Setup

## General

- [ ] Manually install various tools from tools/dots repo via `tools:system/deploy/deploy`
- [ ] Manually symlink dotfiles

### tmux

- [ ] Manually install tmp
- [ ] Run tpm

### neovim

See "nvim:README.md > Fresh Install Instructions"

