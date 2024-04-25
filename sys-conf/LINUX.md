# Linux Setup

This file tracks installed packages and applications, as well as any "installed" config that's meaningful enough to track. This list attempts to be exhaustive, but it's of course possible that I have missed or will miss something.

My goal is to eventually use this document to add Nix based declarative system config.

## Installs

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

## Configuration

### Misc

- [ ] increase max # file watchers (fixes nvim-tree issues): `echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p`)

