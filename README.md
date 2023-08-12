# dotfiles

My "dotfiles", or to the uninitiated like myself, the configuration files that drive the look, feel, and behavior of the tools I use everyday.

These files are very much a work in progress--as they always should be, I think!--as I've just started to conceptualize them as a "project" in
and of themselves. 🙃

## My Setup

These files are shared across two laptops: my work computer, a 2019 MacBook Pro running Ventura, and my personal laptop, a StarBook Mk. VI
running Zorin OS. I do my best to keep my config platform agnostic, but there are some bits of config that are necessarily specific to specific
machines. I try to handle that gracefully, but I'm sure there are better solutions I'll discover in the fullness of time. If you have suggestions,
please reach out!

### Active Work

- [ ] Adding [Gitleaks](https://github.com/gitleaks/gitleaks-action) to my personal git workflows
- [ ] Implementing my ideal [Neovim](editors/nvim/) setup
- [ ] Tweaking my keymaps across all tools so my hands hurt less 👴

### Paused Work

- [ ] [Xplr](https://github.com/sayanarijit/xplr) - love the concept, but haven't been able to devote enough time to really make it my own/incorporate into daily workflows
- [ ] [Tmux](https://github.com/tmux/tmux) - I feel like I've only scratched the surface here, but I'm honestly pretty satisfied with what it does for me now
- [ ] Further consolidation of work/personal dots - I got my shell rc more or less there, and that's 90% of it

### Future Work

All kinds of stuff! But in all seriousness:

* I'd like to play around with [Taskwarrior](https://github.com/GothenburgBitFactory/taskwarrior) and [Timewarrior](https://github.com/GothenburgBitFactory/timewarrior)
* I like keeping the "source of truth" of my dotfiles outside of their natural structure in the system, i.e.: `~/Workspace/dotfiles/*` instead of `~/.config/*` or `~/.*`, but I also want some system to keep them deployed, synced, and up to date across systems
  * I'm looking at [dotsync](https://github.com/dotphiles/dotsync), but that's only one piece of the puzzle
  * Keep your eye on TODO for an evolving idea I have involving symlinks and a cron (or a new tool I've found called [entr](https://github.com/eradman/entr)) (or a systemd path unit)
* I'm pretty comfortable in the Bash universe, but I've heard good things about [Zsh](https://www.zsh.org), and I've always had a fascination with [Fish](https://fishshell.com). I may try my experiment with some other shells in the near-mid term, but a wholesale shell migration *feels* like it would be a large undertaking
* After I had to wipe my personal laptop due to a bad linux install, it occurred to me that my process for setting up a new system is painfully manual (also an issue when trying to sync installed software b/w multiple laptops)
  * I'm thinking of exploring [Nix](https://github.com/NixOS/nix) to make this significantly (I think...) easier
* I'd like some mechanism to live sync b/w machines shared state not suitable for a git repo, i.e.: DBs for tools like zoxide, code templates, etc.
  * I don't think I'd get much pushback on the idea that something like the DB instance that backs a zoxide installation doesn't belong in a git repo, but I may get some on the idea that code templates don't 
  * That pushback may be warranted, but at the very least, if templates do belong in a repo, I think it should be repo other than the one managing my dotfiles/IDE (in this case, nvim)

## Structure

```

├── editors
│   ├── nvim
│   └── vim
├── system
│   ├── shell
│   │   └── bash
│   │       ├── extensions
│   │       └── machine-spc
│   └── terminal
├── tooling
│   ├── git
│   ├── internal
│   │   └── snaphot
│   ├── s-search
│   ├── tmux
│   └── xplr
└── work
    ├── editors
    │   └── vim
    └── tooling
        ├── git
        └── tmux
```

