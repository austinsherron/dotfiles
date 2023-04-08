# dotfiles

My "dotfiles", or to the uninitiated like myself, the configuration files that drive the look, feel, and behavior of the tools I use everyday.

These files are very much a work in progress--as they always should be, I think!--as I've just started to conceptualize them as a "project" in
and of themselves. 🙃

## My Setup

These files are shared across two laptops: my work computer, a 2019 MacBook Pro running Ventura, and my personal laptop, a StarBook Mk. VI 
running Zorin OS. I do my best to keep my config platform agnostic, but there are some bits of config that are necessarily specific to specific
machines. I try to handle that gracefully, but I'm sure there are better solutions I'll discover in the fullness of time. If you have suggesstions,
pleae reach out!

## Active Work

* [Gitleaks](https://github.com/gitleaks/gitleaks-action)
* [Neovim](editors/nvim/)
* Tweaking my keymaps across all tools so that my hands hurt less 👴

## Paused Work

* [Xplr](https://github.com/sayanarijit/xplr) - love the concept, but haven't been able to devote enough time to really make it my own/incorporate daily workflows
* Tmux - I've done a little tweaking/customization here, and I'm honestly pretty satisfied with what it does for me now
* Further consolidation of work/personal dots - I got my shell rc more or less there, and that 90% of it 

## Future Work

All kinds of stuff! But in all seriousness: 

* I'd like to play around with [Taskwarrior](https://github.com/GothenburgBitFactory/taskwarrior) and [Timewarrior](https://github.com/GothenburgBitFactory/timewarrior)
* I like keeping the "source of truth" of my dotfiles outside of their natural structure in the system, i.e.: `~/Workspace/dotfiles/*` instead of `~/.config/*` or `~/.*`, but I also want some system to keep them deployed, synced, and up to date across systems
  * I'm looking at [dotsync](https://github.com/dotphiles/dotsync), but that's only one piece of the puzzle
  * Keep your eye on TODO for an evolving idea I have involing symlinks and a cron

## Structure

```
.
├── editors
│   ├── nvim
│   └── vim
├── system
│   ├── shell
│   │   └── bash
│   └── terminal
├── tooling
│   ├── git
│   ├── s-search
│   ├── tmux
│   └── xplr
└── work
    ├── editors
    │   └── vim
    └── tooling
        ├── git
        └── tmux
```

