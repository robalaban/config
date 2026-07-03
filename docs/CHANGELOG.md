# Changelog

All notable changes to the config will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),

## [0.0.8] - 2026-07-03

### Added

- feat: add neovim (git diff/merge tools and vim aliases pointed at it but it was never installed)
- feat: AGENTS.md project memory (CLAUDE.md symlink) for coding agents
- feat: manage `~/.aerospace.toml` declaratively via home-manager

### Changed

- fix: home-manager deprecations — `programs.git.extraConfig`/`userName`/`userEmail`/`aliases` moved under `programs.git.settings`, `nixfmt-classic` → `nixfmt`, `pkgs.system` → `pkgs.stdenv.hostPlatform.system`
- fix: `darwin-rebuild switch` now runs under sudo (required by newer nix-darwin)
- fix: set `home-manager.backupFileExtension` so existing dotfiles are backed up instead of aborting activation; migrated hand-written `~/.zprofile` PATH entries into zsh.nix

### Removed

- chore: audit cleanup — unused flake inputs (`utils`, `nixpkgs-darwin`, `nixpkgs-master`), dead x86 overlay, empty `spacebar.nix`, unsourced zsh plugin packages, redundant homebrew PATH export, `rebuild.sh` (use `make rebuild`)
- chore: remove pi coding agent (`llm-agents` input, overlay, `pi/` scaffolding)
- chore: remove npx-based `claude` wrapper (shadowed by the `claude-code` cask)
- chore: remove EOL `openssl@1.1` brew and brew-managed `rust` (per-project flakes instead)
- chore: remove pipx/poetry/cursor-agent leftovers from `~/.local/bin`

## [0.0.7] - 2026-05-04


### Added

- feat: add pi coding agent (pi.dev) via numtide/llm-agents.nix flake
- feat: declarative pi extensions/skills/prompts under `pi/`, symlinked into `~/.pi/agent/` via home-manager

## [0.0.6] - 2025-05-28


### Changed

- chore: upgrade to nix 25.05
- feat: removed unused brews

## [0.0.5] - 2023-06-26


### Changed

- chore: add main as default branch in git
- fix: alacrity alt_send_esc
- fix: removed poetry - managing python env from flakes

### Added

- feat: add zed
- feat: alacritty update
- feat: auto-update brew on env change
- feat: disable vscode telemetry + extras
- feat: add rust + dev specifics
- feat: add karabiner elements
- feat: add insomnia
- feat: add wrangler


## [0.0.4] - 2023-05-16

### Changed

- Brew autoupdtes when reloading env

## [0.0.3] - 2023-03-26

### Added

- Add `podman` - docker alternative, plays better on Apple silicon
- Add `tree` ( unix tree for mac )
- Add `exa` better `ls` ( written in Rust )

### Changed

- Readme, added project structure information
- VSCode config

## [0.0.2] - 2023-03-22

### Changed

- Add `flake.lock` to git - standard is to commit lock files [read more here](https://github.com/NixOS/nix/issues/5810)

## [0.0.1] - 2023-03-21

### Added

- Initial commit
- Add `nix` / `home-manager` / `nix-darwin`
- Add `brew` to manage GUI apps
