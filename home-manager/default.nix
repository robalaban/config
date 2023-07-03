{ config, pkgs, lib, ... }:

# Home-manager resources
# https://github.com/mjstewart/nix-home-manager
# Mostly used for CLI tools

{
  home.stateVersion = "22.11";

  imports = [
    ./config/alacritty.nix
    ./config/starship.nix
    ./config/zsh.nix
    ./config/vscode/default.nix
    ./config/git.nix
    ./config/helix.nix
  ];

  home.packages = with pkgs;
    [
      # Some basics
      coreutils
      curl
      wget
      tree
      exa # ls replacement

      # Dev stuff
      # (agda.withPackages (p: [ p.standard-library ]))
      jq
      nodePackages.typescript
      nodejs
      nixfmt
      neovim
      difftastic
      podman
      wrangler
      cmake
      protobuf

      # Useful nix related tools
      cachix # adding/managing alternative binary caches hosted by Cachix
      niv # easy dependency management for nix projects

    ] ++ lib.optionals stdenv.isDarwin [
      m-cli # useful macOS CLI commands
    ];

  programs = {
    home-manager = { enable = true; };
    direnv = {
      nix-direnv = { enable = true; };
      enable = true;
    };
    bat = {
      enable = true;
      config.theme = "gruvbox-dark";
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultOptions =
        [ "--height 40%" "--layout=reverse" "--border" "--inline-info" ];
    };
    htop = {
      enable = true;
      settings = {
        hide_userland_threads = true;
        highlight_base_name = true;
        shadow_other_users = true;
        show_program_path = false;
        tree_view = false;
      };
    };
    tmux = {
      enable = true;
      clock24 = true;
    };
  };
}
