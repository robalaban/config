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

    brews = [ "openssl" "openssl@1.1" "qemu" "rust" "stockfish" ];

    casks = [
      # Utils
      "1password"
      "raycast"
      "rectangle"
      "alt-tab"
      "vlc"
      "dbeaver-community"

      # Office
      "dropbox"
      "spotify"
      "microsoft-office"
      "obsidian"
      "slack"

      # Dev
      "zed"
      "datagrip"
      "intellij-idea"
      "pycharm"
      "insomnia"
      "karabiner-elements"
      "ghostty"
      "claude-code"
    ];
  };
}
