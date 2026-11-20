{ pkgs, ... }:
{
  imports = [
    ./brew.nix
    ./preferences.nix
  ];

  nix = {
    # cache.nixos.org and its key are nix defaults — no need to list them.
    settings = {
      trusted-users = [ "@admin" ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      extra-platforms = [
        "x86_64-darwin"
        "aarch64-darwin"
      ];
    };
    package = pkgs.nixVersions.stable;

    # Keep /nix/store from growing unbounded: weekly, drop generations older
    # than 30 days and hard-link duplicate files. (`auto-optimise-store` is
    # avoided — optimising during builds is known to corrupt the store on macOS.)
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
    optimise.automatic = true;
  };

  users.users.robert = {
    name = "robert";
    home = "/Users/robert";
  };

  ########################
  # System configuration #
  ########################

  networking = {
    knownNetworkServices = [
      "Wi-Fi"
      "Thunderbolt Ethernet"
    ];
    dns = [
      "1.1.1.1"
      "8.8.8.8"
    ];
  };

  # Create /etc/zshenv etc. that load the nix-darwin environment.
  # Completion and prompt are set up by home-manager (oh-my-zsh + starship);
  # doing it here too would run compinit twice on every shell start.
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    enableBashCompletion = false;
    promptInit = "";
  };

  # zsh itself comes from home-manager's programs.zsh, tailscale from
  # services.tailscale below.
  environment.systemPackages = with pkgs; [
    nodejs_22
  ];

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
