# dotfiles

My "dotfiles", the configuration files that drive the look, feel, and behavior of the tools I use everyday.

These files have been a work in progress--as they always should be, I think!--but over the last year or so they evolved quite a bit.

## My Setup

These files are shared across two laptops: my work computer, a 2023 M3 MacBook and my personal laptop, a System76 Darter Pro running Pop!_OS.

I use chezmoi and some home-baked os/host based script injection to handle differences across machines. I define my environments declaratively via the yaml files in the manifest directory and chezmoi scripts.

### Structure

```
.
├── chezmoi  - chezmoi source dir; contains actual dotfiles; every non-hidden file is deployed in some way to dotfiles target
├── manifest - manifests of components to install + manifest checksums to prevent repetitive deployments; manifest/* is sym-linked to chezmoi/.chezmoidata
├── scripts  - bootstrapping and chezmoi scripts (scripts/hooks); scripts/hooks/* is sym-linked to chezmoi/.chezmoiscripts
└── sys-conf - os specific docs that describe whats/hows of system configuration; ideally will be removed as I automate more system config
```

### Active Work

#### [Gitleaks](https://github.com/gitleaks/gitleaks-action)

When I first pushed this repo and make it public, though I thought I'd checked everything, I exposed a minor, but still sensitive, credential.
Luckily it was caught inside of a couple days and no harm was done. But it's a reminder that these things can't be left at good intentions and
*almost* good enough. Automation to the rescue. 🤖

#### [chezmoi](https://www.chezmoi.io/user-guide/command-overview)

I've recently adopted chezmoi; I'm really liking it so far. I think I may be using it a bit differently than intended, but I'm happy with the workflows it's enabled.

### Paused Work

- [ ] [xplr](https://github.com/sayanarijit/xplr) - love the concept, but haven't been able to devote enough time to really make it my own/incorporate into daily workflows

### Future Work

* I'd like some mechanism to live sync b/w machines shared state not suitable for a git repo, i.e.: DBs for tools like zoxide, spell files, shell history, etc.
* I'd like to play around with [Taskwarrior](https://github.com/GothenburgBitFactory/taskwarrior) and [Timewarrior](https://github.com/GothenburgBitFactory/timewarrior)
* I'm pretty comfortable in the Bash universe, but I've heard good things about [Zsh](https://www.zsh.org), and I've always had a fascination with [Fish](https://fishshell.com). I may try my experiment with some other shells in the near-mid term, but a wholesale shell migration *feels* like it would be a large undertaking
* I'm thinking of exploring [Nix](https://github.com/NixOS/nix) and [home-manager](https://github.com/nix-community/home-manager)

