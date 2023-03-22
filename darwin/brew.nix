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
    global.brewfile = true;

    brews = [ "openssl" "openssl@1.1" ];

    casks = [
      # Utils
      "1password"
      "raycast"
      "google-chrome"
      "rectangle"
      "logitech-options"
      "alt-tab"

      # Office
      "dropbox"
      "spotify"

      # Dev
      "alacritty"
    ];

    taps = [ "homebrew/cask" "homebrew/cask-versions" "homebrew/cask-drivers"];
  };
}
