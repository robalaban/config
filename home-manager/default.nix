{
  config,
  pkgs,
  lib,
  ...
}:

# Home-manager resources
# https://github.com/mjstewart/nix-home-manager
# Mostly used for CLI tools

{
  home.stateVersion = "22.11";

  imports = [
    ./config/starship.nix
    ./config/zsh.nix
    ./config/vscode/default.nix
    ./config/git.nix
    ./config/helix.nix
  ];

  # AeroSpace reads ~/.aerospace.toml; keep the config version-controlled
  home.file.".aerospace.toml".source = ../darwin/aerospace.toml;

  # Homebrew 6 requires third-party taps to be trusted (`brew trust`).
  # brew bundle (run during darwin activation as robert) reads
  # ~/.homebrew/trust.json. Keep in sync with homebrew.taps in darwin/brew.nix.
  home.file.".homebrew/trust.json" = {
    text = builtins.toJSON { trustedtaps = [ "nikitabobko/tap" ]; };
    force = true;
  };

  home.packages =
    with pkgs;
    [
      # Some basics
      coreutils
      curl
      wget
      tree
      eza # ls replacement

      # Dev stuff
      # (agda.withPackages (p: [ p.standard-library ]))
      jq
      nixfmt
      difftastic
      neovim
      cmake
      protobuf
      ffmpeg

      # Useful nix related tools
      cachix # adding/managing alternative binary caches hosted by Cachix
      niv # easy dependency management for nix projects

    ]
    ++ lib.optionals stdenv.isDarwin [
      m-cli # useful macOS CLI commands
    ];

  programs = {
    home-manager = {
      enable = true;
    };
    direnv = {
      nix-direnv = {
        enable = true;
      };
      enable = true;
    };
    bat = {
      enable = true;
      config.theme = "gruvbox-dark";
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultOptions = [
        "--height 40%"
        "--layout=reverse"
        "--border"
        "--inline-info"
      ];
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
