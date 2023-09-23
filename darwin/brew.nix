{ config, ... }:

# Using Brew until nix-darwin is patched and working with
# /Application folder

let user_name = "robert";
in {
  environment.shellInit = ''
    eval "$(${config.homebrew.brewPrefix}/brew shellenv)"
  '';

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    onActivation.upgrade = true;
    global.brewfile = true;

    brews = [ "openssl" "openssl@1.1" "qemu" "rust" ];

    casks = [
      # Utils
      "1password"
      "raycast"
      "rectangle"
      "alt-tab"
      "vlc"

      # Office
      "dropbox"
      "spotify"
      "microsoft-office"
      "obsidian"
      "mullvadvpn"
      "slack"

      # Dev
      "alacritty"
      "zed"
      "podman-desktop"
      "datagrip"
      "pycharm"
      "insomnia"
      "karabiner-elements"
      "balenaetcher"
    ];

    taps = [ "homebrew/cask" "homebrew/cask-versions" "homebrew/cask-drivers" ];
  };
}
