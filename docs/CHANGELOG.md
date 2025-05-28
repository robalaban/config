# Changelog

All notable changes to the config will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),

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
