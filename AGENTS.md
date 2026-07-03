# AGENTS.md

This file provides guidance to coding agents (Claude Code, codex, etc.) when working with code in this repository. CLAUDE.md is a symlink to this file.

## What This Repo Is

Robert's personal Nix configuration for a MacBook (Apple Silicon, `aarch64-darwin`), living directly in `~/.config`. It manages the macOS system, GUI apps, dotfiles, and dev tooling via [nix-darwin](https://github.com/LnL7/nix-darwin), [home-manager](https://github.com/nix-community/home-manager), and Nix flakes. The single flake output is `darwinConfigurations.robert`.

Note: `~/.config` also contains runtime config written by apps (e.g. `karabiner/`, `qBittorrent/`, `containers/`) and symlinks into the nix store (e.g. `htop`, `starship.toml`, `result`). These are ignored via `.gitignore` — only the Nix sources and a few hand-picked files (e.g. `zed/settings.json`) are tracked.

## Commands

| Command | What it does |
|---|---|
| `make rebuild` | Build the config and `sudo darwin-rebuild switch` to apply it |
| `nix build .#darwinConfigurations.robert.system` | Build only — the "test" to run before/after changes, without applying anything |
| `make update` | Update all flake inputs (`nix flake update`) |
| `make clean` | Garbage-collect old generations (`nix-collect-garbage -d`) |
| `make upgrade` | Upgrade Nix itself |
| `nixfmt` | Format `.nix` files |

## Verifying Changes

There is no test suite; the check is that the system closure still builds:

```shell
git add <new-or-changed-files>   # REQUIRED first — see gotcha below
nix build .#darwinConfigurations.robert.system
```

Run this before considering any change done. Only run `make rebuild` (which actually mutates the system and needs sudo) when the user wants the change applied.

**Gotcha:** flakes only see files tracked by git. A new file that isn't `git add`ed is invisible to `nix build` and produces confusing "file not found" errors. Always stage new files before building.

## Structure & Where Things Go

- `flake.nix` — entry point; wires nix-darwin + home-manager (inputs: `nixpkgs` unstable, `darwin`, `home-manager`).
- `darwin/` — macOS system level:
  - `default.nix` — nix settings, networking, fonts, keyboard remaps, Tailscale, TouchID sudo, `environment.systemPackages`.
  - `brew.nix` — Homebrew-managed GUI apps (casks) and a few brews. GUI apps go here, not in nixpkgs, because of `/Applications` handling. `onActivation.cleanup = "zap"` means apps removed from this list get uninstalled on rebuild.
  - `preferences.nix` — macOS system preferences (defaults).
  - `aerospace.toml` — AeroSpace window manager config, symlinked to `~/.aerospace.toml` via home-manager.
- `home-manager/` — user-level packages and dotfiles:
  - `default.nix` — CLI packages (`home.packages`) and simple `programs.*` config (fzf, htop, tmux, bat, direnv).
  - `config/*.nix` — one module per tool: zsh, git, starship, helix, vscode.
- `docs/CHANGELOG.md` — changelog of notable modifications; update it for significant changes.

Rule of thumb for adding a package: CLI tool → `home-manager/default.nix` `home.packages`; GUI app → `darwin/brew.nix` casks; system daemon/service or shell-level tool → `darwin/default.nix`.
