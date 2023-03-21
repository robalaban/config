# Nix config for MacOS

![2d graphics, laptop in the middle of a cyberpunk city, screen glowing, neon lightning, with a wrench as the wallpaper 2d --ar 16:9](assets/cover.png "Generated with Midjourney: 2d graphics, laptop in the middle of a cyberpunk city, screen glowing, neon lightning, with a wrench as the wallpaper 2d --ar 16:9")

This is config, it manages my Macbook ( apple silicon ) installation, dotfiles and some development packages. It's based on [nix-darwin](https://github.com/LnL7/nix-darwin), [home-manager](https://github.com/nix-community/home-manager) and [nix-flakes](https://nixos.wiki/wiki/Flakes).

This repository keeps a [changelog](docs/CHANGELOG.md) of the most important modifications.

## Installation

Install nix using the official docs [here](https://nixos.org/download.html#nix-install-macos). Git clone the repository, ( recomendation is in ) `.config`, look thorugh, replace usernames / hosts and git email address with your one.

## Notes

This repository is focused on Macbooks with Apple silicon `aarch64-darwin`.

Keep in mind that if you are working with Nix flakes inside of a git repository, `nix` considers any modifications which
are not added as "dirty". To fix this, add the items to the staging area, using `git add .` before running `darwin-rebuild switch`.

This repository is inspired by a lot of folks who have taken time to share their personal Nix configurations and knowladge. In no particular order here are some of them:

- https://github.com/phlmn/nix-darwin-config
- https://github.com/nix-community/home-manager
- https://xyno.space/post/nix-darwin-introduction
