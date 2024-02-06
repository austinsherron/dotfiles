# Linux Setup

This file tracks installed packages and applications, as well as any "installed" config that's meaningful enough to track. This list attempts to be exhaustive, but it's of course possible that I have missed or will miss something.

My goal is to eventually use this document to add Nix based declarative system config.

## Installs

### Package Managers

#### apt

Installed w/ package of the same name via `sudo apt install` unless otherwise stated.

- [ ] adb
- [ ] ag (aka: silversearcher-ag)
- [ ] alacritty
- [ ] bash-completion
- [ ] bat (aka: batcat)
- [ ] chrome-gnome-shell
- [ ] cloc
- [ ] cmake
- [ ] colordiff
- [ ] devilspie2
- [ ] evtest
- [ ] fzf
- [ ] g++
- [ ] gconf2
- [ ] gnome-shell-extension-manager
- [ ] imagemagick - specifically installed `imagemagick-6.q16`
- [ ] img2pdf
- [ ] Kdenlive
- [ ] libavahi-compat-libdnssd-dev
- [ ] libcurl4-openssl-dev
- [ ] libice-dev
- [ ] libsm-dev
- [ ] libssl-dev
- [ ] libx11-dev
- [ ] lua5.3
- [ ] pamu2fcfg
- [ ] pcscd
- [ ] policykit-1-gnome
- [ ] postfix
- [ ] python3-pip
- [ ] python3.10-venv
- [ ] qttools5-dev
- [ ] qtbase5-dev
- [ ] ripgrep
- [ ] shellcheck
- [ ] snap
- [ ] snapd
- [ ] stow
- [ ] timeshift
- [ ] tlp - started w/ `sudo systemctl enable tlp.service && sudo tlp start`
- [ ] tmux
- [ ] tree
- [ ] xdotool
- [ ] xorg-dev
- [ ] xsel
- [ ] ubuntu-restricted-extras
- [ ] vim
- [ ] vlc
- [ ] whois
- [ ] yubikey-manager
- [ ] yubikey-manager-qt
- [ ] zoxide

##### purge

Purged w/ package of the same name via `sudo apt purge` unless otherwise stated.

- [ ] python3-setuptools

#### cargo

- [ ]  syngestures
    - [ ] For non-root installation, run: `sudo chown ${USER} /dev/input/by-path/pci-0000:00:15.0-platform-i2c_designware.0-event-mouse`

#### flatpak

Installed w/ `flatpak` install unless otherwise stated. Package FQNs are listed w/ the package names.

- [ ] Fragments - `flatpak install flathub de.haeckerfelix.Fragments`
- [ ] krita - `flatpak install krita`
- [ ] seahorse - `flatpak install seahorse`
- [ ] tor - `flatpak install flathub com.github.micahflee.torbrowser-launcher`
- [ ] yubico-authenticator - `flatpak install flathub com.yubico.yubioath`

#### snap

Installed w/ `sudo snap install` unless otherwise stated.

- [ ] chezmoi --classic
- [ ] firefox
- [ ] htop
- [ ] plexmediaserver
- [ ] task --classic
- [ ] yq

#### Language Specific

##### luarocks

Installed for lua 5.3 via `sudo luarocks install [rock-name]` unless otherwise stated.

- [ ] bit32@5.3.5.1-1
- [ ] busted@2.1.2-3
- [ ] luacov@0.15.0-1
- [ ] luafilesystem@1.8.0-1
- [ ] see@0.1-1
- [ ] yaml@1.1.2-1

##### pip3

- [ ] SQLAlchemy
- [ ] coverage
- [ ] flask
- [ ] neovim-remote
- [ ] progressbar2
- [ ] pyopenssl
- [ ] rope
- [ ] selenium
- [ ] selenium-driver-updater
- [ ] webdriver-auto-update
- [ ] webdriver-manager

### Script

Installed by listed install script via `sudo ./${DEV_ROOT}/scripts/install/[os]/[script-name]` unless otherwise stated.

- [ ] [1password](https://support.1password.com/install-linux/#debian-or-ubuntu) - `1password.sh"`
- [ ] [app-image-launcher](https://github.com/TheAssassin/AppImageLauncher/wiki/Install-on-Ubuntu-or-Debian) - `app-image-launcher.sh`
- [ ] [bisq](https://bisq.network/getting-started/) - `bisq.sh`
- [ ] [brave](https://brave.com/linux/) - `brave.sh"`
- [ ] [cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html) - `cargo.sh`
- [ ] [dropbox](https://www.dropbox.com/install-linux) - `dropbox.sh`
- [ ] [gh-cli](https://github.com/cli/cli/blob/trunk/docs/install_linux.md) - `gh-cli.sh`
- [ ] [git](https://git-scm.com/download/linux) - `git.sh`
- [ ] [golang](https://go.dev/dl/) - `golang.sh`
- [ ] [google-chrome](https://itsfoss.com/install-chrome-ubuntu/) - `google-chrome.sh"`
- [ ] [guake](https://guake.readthedocs.io/en/latest/user/installing.html#system-wide-installation) - `guake.sh`
- [ ] [i2p](https://geti2p.net/en/download/debian) - `i2p.sh`
- [ ] [lazygit](https://github.com/jesseduffield/lazygit#installation) - `lazygit.sh`
- [ ] [librewolf](https://librewolf.net/installation/debian/) - `librewolf.sh"`
- [ ] [luarocks-3.9.2](https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Unix) - `luarocks.sh`
- [ ] [mullvad](https://github.com/mullvad/mullvadvpn-app/) - `mullvad.sh"`
- [ ] [nerd fonts](https://www.nerdfonts.com/font-downloads) - Download to `${HOME/Customizations/Fonts}`, unzip, open individual files, install via GUI
- [ ] [nvim]() - `nvim.sh`
- [ ] [s-search](https://github.com/zquestz/s) - `s-search.sh` (w/o `sudo`)
- [ ] [signal](https://signal.org/download/linux/) - `signal.sh"`
- [ ] [speedtest](https://www.speedtest.net/apps/cli) - `speedtest.sh"`
- [ ] [starship](https://starship.rs/) - `starship.sh`
- [ ] [system76-keyboard-configurator](https://github.com/pop-os/keyboard-configurator/) - `system76-keyboard-configurator.sh"`
- [ ] [whatsapp-for-linux](https://github.com/eneshecan/whatsapp-for-linux/wiki) - `whatsapp-for-linux.sh"`
- [ ] [xplr](https://xplr.dev/en/install) - `xplr.sh`
- [ ] [zoom](https://zoom.us/download?os=linux) - `zoom.sh"`

### Pop Shop

- [ ] gThumb
- [ ] GSConnect
- [ ] Okular
- [ ] OpenShot

### Ported From Previous System

Format = "name - version - notes"

- [ ] balenaEtcher - 1.18.4
- [ ] Bazecor - 1.1.2
- [ ] Bitwarden - 2023.5.0
- [ ] Brave - ?
- [ ] KeePassXC - 2.7.4 + 2.7.5
- [ ] Neovim - ? - "GUI" launcher, really just a shortcut for nvim in a terminal
- [ ] Notesnook - 2.4.4
- [ ] UHK Agent - 2.1.2
- [ ] Vim - 2.1.2 - don't remember installing this, seems to be the same as its nvim counterpart
- [ ] YubiKey Manager - ? - seems borked

### Gnome Shell Extensions

Pre-reqs:

- [ ] Apps, Packages, and Tools > External > `apt` > gnome-shell-extension-manager
- [ ] GNOME Shell Integration browser extension (Brave, manually installed)

Format: name - notes

- [ ] Bluetooth Quick Connect - ported from previous laptop
- [ ] Clipboard Indicator - ported from previous laptop
- [ ] Emoji Selector - ported from previous laptop
- [ ] Pop Shell - ported from previous laptop
- [ ] Sound Input & Output Device Chooser - ported from previous laptop
- [ ] Transparent Window Moving - ported from previous laptop
- [ ] Vitals - ported from previous laptop

#### Previous Machine

##### Manually Installed

- [ ] Bluetooth Quick Connect
- [ ] Clipboard Indicator
- [ ] Dash to Dock
- [ ] Dash to Plank - disabled
- [ ] Emoji Selector
- [ ] GSConnect - disabled
- [ ] Lock screen Background
- [ ] Multi Monitors Add-On
- [ ] Night Light Slider
- [ ] Pop Shell
- [ ] Screenshot Locations
- [ ] Sound Input & Output Device Chooser
- [ ] Transparent Window Moving
- [ ] Vitals

##### Built-In

- [ ] Applications Menu
- [ ] Auto Move Windows
- [ ] Horizontal workspaces
- [ ] Launch new instance
- [ ] Native Window Placement
- [ ] Place Status Indicator
- [ ] Removable Drive Menu
- [ ] Remove Dropdown Arrows
- [ ] Screenshot Window Sizer
- [ ] User Themes
- [ ] Window List
- [ ] windowNavigator
- [ ] Workspace Indicator
- [ ] X11 Gestures

## Internal

Note: unfortunately, I haven't maintained these lists, so they've fallen a bit out of date. Looking at my dotfiles, scripts, and tools repos should make clear what needs to be "deployed".

### Dotfiles

- [ ] 2-fa - `ln -s ${TOOLING_ROOT}/internal/web/2-fa ${CONFIG_ROOT_PUB}/2-fa`
- [ ] bash profile - `ln -s ${SHELL_ROOT}/bash_profile ${HOME}/.bash_profile`
- [ ] bash rc - `ln -s ${SHELL_ROOT}/bashrc ${HOME}/.bashrc`
- [ ] git config - `ln -s ${TOOLING_ROOT}/git/gitconfig ${HOME}/.gitconfig`
- [ ] git ignore - `ln -s ${TOOLING_ROOT}/git/gitignore ${HOME}/.gitignore`
- [ ] input rc - `ln -s ${SHELL_ROOT}/inputrc ${HOME}/.inputrc`
- [ ] lazygit - `ln -s ${TOOLING_ROOT}/lazygit/config.yaml ${CONFIG_ROOT_PUB}/lazygit/config.yaml`
- [ ] nvim - `ln -s ${NVIM_ROOT} ${CONFIG_ROOT_PUB}`
- [ ] shared paths script - `deploy -s ${SHELL_ROOT} -t /etc/profile.d shared`
- [ ] snapshot - `cp -r ${TOOLING_ROOT}/internal/snapshot ${SHARED_CONFIG_ROOT}/`
- [ ] starship init - `ln -s ${SHELL_ROOT}/extensions/starship.sh ${CONFIG_ROOT_PUB}/starship.sh`
- [ ] starship conf - `ln -s ${SHELL_ROOT}/extensions/starship.toml ${CONFIG_ROOT_PUB}/starship.toml`
- [ ] tmux - `ln -s ${TMUX_ROOT} ${CONFIG_ROOT_PUB}`
- [ ] tmux scripts - `cd ${TOOLING_ROOT} && deploy -s tmux scripts`
- [ ] vim conf dir - `ln -s ${VIM_ROOT}/vim ${HOME}/.vim`
- [ ] vim rc - `ln -s ${VIM_ROOT}/vimrc ${HOME}/.vimrc`
- [ ] xmodmap - `ln -s ${CONFIG_ROOT}/system/keymap/xmodmap/xmodmaprc ${LEGACY_CONFIG_ROOT_PUB}/.xmodmaprc`

### Crontab Entries

- [ ] enable-wakeup - `crontabctl -s @reboot -c enable-wakeup` (see tools > system/misc/enable-wakeup)
- [ ] set-wakeup - `crontabctl -s "* * * * *" -c set-wakeup` (see tools > system/cron/set-wakeup)

### Systemd Units

- [ ] mv-stg-backups.path - `sush` -> `${TOOLS_ROOT}/system/systemd/mv-stg-backups/install`
- [ ] run-snapshot.timer - `sush` -> `${TOOLS_ROOT}/system/systemd/run-snapshot/install`

### Scripts

- [ ] enable-wakeup - `deploy -s [TODO: TBD]/enable-wakeup`

### Tools

- [ ] `config/*` - `deploy -s util config`
- [ ] `log/*` - `deploy logs`
- [ ] `snapshot/*` - `deploy -s system snapshot`
- [ ] `system/config/*` - `deploy -s system logs`
- [ ] `system/config/*` - `deploy -s system config`
- [ ] `system/deploy/*` - `deploy -s system deploy`
- [ ] `system/systemd/utils/*` - `deploy -s system/systemd utils`
- [ ] `validation/*` - `deploy -s system validation`
- [ ] `web/*` - `deploy -s util web`

