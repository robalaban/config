# Nix config for MacOS

![2d graphics, laptop in the middle of a cyberpunk city, screen glowing, neon lightning, with a wrench as the wallpaper 2d --ar 16:9](assets/cover.png "Generated with Midjourney: 2d graphics, laptop in the middle of a cyberpunk city, screen glowing, neon lightning, with a wrench as the wallpaper 2d --ar 16:9")

This is config, it manages my Macbook (Apple silicon) installation, dotfiles and some development packages. It's based on [nix-darwin](https://github.com/LnL7/nix-darwin), [home-manager](https://github.com/nix-community/home-manager) and [nix-flakes](https://nixos.wiki/wiki/Flakes).

This repository keeps a [changelog](docs/CHANGELOG.md) of the most important modifications.

## Installation

Install nix using the [official docs](https://nixos.org/download.html#nix-install-macos). Git clone the repository, (recommendation is in) `.config`, look through, replace usernames / hosts and git email address with your own.

## Project Structure

```shell
├── configuration.nix
├── darwin # everything related to MacOS
│   ├── brew.nix # brew packages - GUI apps
│   ├── default.nix # system configuration
│   ├── preferences.nix # system preferences
├── home-manager # dotfiles
│   ├── config # all the dotfiles configuration
│   │   ├── alacritty.nix
│   │   ├── git.nix
│   │   ├── starship.nix
│   │   ├── vscode # VSCode configuration
│   │   │   └── default.nix
│   │   └── zsh.nix # zsh configuration
│   └── default.nix
```

## Notes

This repository is focused on Macbooks with Apple silicon `aarch64-darwin`.

Keep in mind that if you are working with Nix flakes inside of a git repository, `nix` considers any modifications which
are not added as "dirty". To fix this, add the items to the staging area, using `git add .` before running `darwin-rebuild switch`.

This repository is inspired by a lot of folks who have taken time to share their personal Nix configurations and knowledge. In no particular order here are some of them:

- https://github.com/phlmn/nix-darwin-config
- https://github.com/nix-community/home-manager
- https://xyno.space/post/nix-darwin-introduction
- https://determinate.systems


## Helpful Commands

```shell
# remove unused references / old-generations
nix-collect-garbage -d
```

## Rebuilding the System

After making changes to the configuration, you need to rebuild the system to apply these changes. There are two ways to do this:

### Manual Rebuild

1. Build the configuration:
   ```
   nix build .#darwinConfigurations.robert.system
   ```

2. Switch to the new configuration:
   ```
   ./result/sw/bin/darwin-rebuild switch --flake .#robert
   ```

### Using the Rebuild Script

For convenience, a rebuild script is provided that combines the build and switch steps:

1. Ensure the script is executable:
   ```
   chmod +x rebuild.sh
   ```

2. Run the script:
   ```
   ./rebuild.sh
   ```