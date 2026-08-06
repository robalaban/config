# AGENTS.md

This file provides guidance to coding agents (Claude Code, codex, etc.) when working with code in this repository. CLAUDE.md is a symlink to this file.

## What This Repo Is

Robert's personal Nix configuration for his MacBooks (Apple Silicon, `aarch64-darwin`), living directly in `~/.config`. It manages the macOS system, GUI apps, dotfiles, and dev tooling via [nix-darwin](https://github.com/LnL7/nix-darwin), [home-manager](https://github.com/nix-community/home-manager), and Nix flakes. There is one flake output per machine — `darwinConfigurations.robert` (personal) and `darwinConfigurations.robert-work` — which share all of `darwin/` and `home-manager/` and differ only by their module in `hosts/`. Flake attribute names match each machine's `LocalHostName`, so `darwin-rebuild switch --flake .` (and `make rebuild`) auto-select the right one.

Note: `~/.config` also contains runtime config written by apps (e.g. `karabiner/`, `qBittorrent/`, `containers/`) and symlinks into the nix store (e.g. `htop`, `starship.toml`, `result`). These are ignored via `.gitignore` — only the Nix sources and a few hand-picked files (e.g. `zed/settings.json`) are tracked.

## Commands

| Command | What it does |
|---|---|
| `make rebuild` | Build the config and `sudo darwin-rebuild switch` to apply it. Host is auto-detected from `scutil --get LocalHostName`; override with `make rebuild HOST=robert-work` (needed once on a freshly renamed machine) |
| `nix build .#darwinConfigurations.robert.system` | Build only — the "test" to run before/after changes, without applying anything (swap in `robert-work` to check the other host) |
| `make update` | Update all flake inputs (`nix flake update`) |
| `make clean` | Garbage-collect old generations (`nix-collect-garbage -d`) |
| `make upgrade` | Upgrade Nix itself |
| `nixfmt` | Format `.nix` files |

## Verifying Changes

There is no test suite; the check is that the system closure still builds:

```shell
git add <new-or-changed-files>   # REQUIRED first — see gotcha below
nix build .#darwinConfigurations.robert.system
nix build --no-link .#darwinConfigurations.robert-work.system
```

Build both hosts when touching shared config (`darwin/`, `home-manager/`, `flake.nix`); building just the affected host is fine for a change scoped to one `hosts/*.nix` file.

Run this before considering any change done. Only run `make rebuild` (which actually mutates the system and needs sudo) when the user wants the change applied.

**Gotcha:** flakes only see files tracked by git. A new file that isn't `git add`ed is invisible to `nix build` and produces confusing "file not found" errors. Always stage new files before building.

## Structure & Where Things Go

- `flake.nix` — entry point; wires nix-darwin + home-manager (inputs: `nixpkgs` unstable, `darwin`, `home-manager`). `mkHost` builds one `darwinConfigurations` entry per machine from a `hosts/` module.
- `hosts/` — per-machine config; one module per machine (`personal.nix`, `work.nix`). Sets the hostname and holds machine-specific packages/casks/settings, which merge with the shared lists in `darwin/` and `home-manager/`.
- `darwin/` — macOS system level (shared by all hosts):
  - `default.nix` — nix settings, networking, fonts, keyboard remaps, Tailscale, TouchID sudo, `environment.systemPackages`.
  - `brew.nix` — Homebrew-managed GUI apps (casks) and a few brews. GUI apps go here, not in nixpkgs, because of `/Applications` handling. `onActivation.cleanup = "zap"` means apps removed from this list get uninstalled on rebuild.
  - `preferences.nix` — macOS system preferences (defaults).
  - `aerospace.toml` — AeroSpace window manager config, symlinked to `~/.aerospace.toml` via home-manager.
- `home-manager/` — user-level packages and dotfiles:
  - `default.nix` — CLI packages (`home.packages`) and simple `programs.*` config (fzf, htop, tmux, bat, direnv).
  - `config/*.nix` — one module per tool: zsh, git, starship, helix, vscode.
- `docs/CHANGELOG.md` — changelog of notable modifications; update it for significant changes.

Rule of thumb for adding a package: CLI tool → `home-manager/default.nix` `home.packages`; GUI app → `darwin/brew.nix` casks; system daemon/service or shell-level tool → `darwin/default.nix`. If the package is for one machine only, put the same option in that machine's `hosts/*.nix` instead (e.g. work-only casks via `homebrew.casks` in `hosts/work.nix`).
