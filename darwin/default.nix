{ inputs, config, pkgs, lib, ... }:
let
  apps = pkgs.buildEnv {
    name = "home-manager-applications";
    paths = config.home.packages;
    pathsToLink = "/Applications";
  };
in {
  imports = [ ./brew.nix ./preferences.nix ];

  nix = {
    settings = {
      substituters = [ "https://cache.nixos.org/" ];
      trusted-public-keys =
        [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
      trusted-users = [ "@admin" ];
    };
    package = pkgs.nixVersions.stable;
    extraOptions = ''
      auto-optimise-store = true
      experimental-features = nix-command flakes
    '' + lib.optionalString (pkgs.system == "aarch64-darwin") ''
      extra-platforms = x86_64-darwin aarch64-darwin
    '';
  };

  users.users.robert = {
    name = "robert";
    home = "/Users/robert";
  };

  ########################
  # System configuration #
  ########################

  networking = {
    knownNetworkServices = [ "Wi-Fi" "Thunderbolt Ethernet" ];
    dns = [ "1.1.1.1" "8.8.8.8" ];
  };

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  # Apps
  # `home-manager` currently has issues adding them to `~/Applications`
  # Issue: https://github.com/nix-community/home-manager/issues/1341
  environment.systemPackages = with pkgs;
    [
      tailscale
      # terminal-notifier
      # Shell
      zsh
      zsh-autosuggestions
      zsh-nix-shell
      zsh-syntax-highlighting
      zsh-autocomplete
    ];

  programs = { nix-index = { enable = true; }; };

  # Fonts
  fonts.packages = with pkgs; [
    recursive
    nerd-fonts.jetbrains-mono
  ];

  system = {
    stateVersion = 2;
    primaryUser = "robert";
  };

  # Keyboard
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  # Tailscale
  services.tailscale.enable = true;

  # Add ability to used TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;
}
