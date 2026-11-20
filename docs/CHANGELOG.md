# Changelog

All notable changes to the config will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),

## [0.0.10] - 2026-11-20

### Added

- feat: add Sublime Text cask (the cask also links `subl` into `/opt/homebrew/bin`)

### Changed

- removed DataGrip, IntelliJ IDEA and PyCharm casks (unused; their multi-GB upgrades made `make rebuild` very slow)
- fix: `make clean` also runs under sudo, so it removes old system generations instead of only user ones
- fix: `stdenv.isDarwin` → `stdenv.hostPlatform.isDarwin` deprecation warning
- perf: weekly automatic `nix.gc` (generations older than 30 days) and `nix.optimise`; replaces `auto-optimise-store`, which is unsafe on macOS
- perf: faster shell startup — nix-darwin no longer runs its own `compinit`/`promptinit` on top of oh-my-zsh + starship
- fix: Finder list view is now set via `system.defaults.finder.FXPreferredViewStyle` (the activation script ran as root and no longer affected the user)
- cleanup: removed unused `nix-index`, `niv`, `cachix`, the oh-my-zsh `history` plugin, redundant `zsh`/`tailscale` system packages, duplicated nix cache settings, dead VS Code settings for uninstalled extensions, and dead code in `flake.nix` / `darwin/default.nix` / `darwin/brew.nix`

## [0.0.9] - 2026-08-06

### Added

- feat: multi-host support — one `darwinConfigurations` entry per machine (`robert` for personal, `robert-work`) built by a shared `mkHost` helper; per-machine config lives in `hosts/personal.nix` / `hosts/work.nix`
- feat: hostnames are now managed by nix-darwin (`networking.hostName`/`localHostName`/`computerName`), named to match the flake attributes so `darwin-rebuild switch --flake .` auto-selects the right host

### Changed

- fix: `make rebuild` auto-detects the host via `scutil --get LocalHostName`; one-time bootstrap on the work machine before it's renamed: `make rebuild HOST=robert-work`

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
