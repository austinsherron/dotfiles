# To-Do Lists

## To-Do

### General

- [ ] Setup atuin sync server
- [ ] Transition to ulogger

### Package Management

- [ ] Fix symbolic link issue; seemingly caused by differences in symlink representation across os types
    - [ ] My idea for a solution involves copying scripts/manifest to .chezmoiscripts/.chezmoidata before runs
- [ ] Add mechanism to remove from system packages that are removed from manifests
- [ ] Add post-install hooks for git repos

#### Linux

- [ ] Install relevant packages that have been installed on darwin

### tmux

- [ ] Investigate incorporating at least pieces of oh-my-tmux

## Done

### Package Management

#### Linux

- [x] Automate git-credential-manager installation/configuration
    - [x] Incorporate this into dotfiles init/bootstrapping
- [x] Update install script to use pkgmgr to install scripts

### tmux

- [x] Install and configure resurrect
- [x] Install and configure continuum
- [x] Make status bar even slightly useful, and please, for the love of god, make it prettier 🤬 (on going process)
- [x] Update left portion of status bar to show [# of] panes in active window and indicate which pane is active. **Note:** Edits in [] (square brackets)
- [x] Incrementally upgrade from 3.0a toward 3.3a to see if there's a newer version that doesn't have 3.3a's issues w/ tpm (upgraded to 3.2a, which doesn't have the aforementioned issues)
- [x] If there's a new enough version that doesn't have the tpm bug, remove the root tmux conf file (`~/.tmux.conf`)
- [x] Since upgrading from 3.0a to 3.2a, check if I can uncomment some/all of the tmux conf lines I had to to temporarily remove after the downgrade from 3.3a
- [x] Fix resizing shortcuts
- [x] Add shortcut for "renaming" panes
- [x] Tmux has "randomly" started straight up failing. It's just broken: it exits as soon as it starts
    - [x] ended up being an issue w/ the resurrect/continuum plugins: the last state file saved was corrupted; the solution was to remove the last state file and relink the next to last to the "last" symlink
- [x] Add layout/resize scripts and integrate them w/ client resize hooks

