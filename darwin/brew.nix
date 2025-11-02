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

    taps = [ "nikitabobko/tap" ];

    brews = [ "openssl" "openssl@1.1" "qemu" "rust" "awscli" ];

    casks = [
      # Utils
      "1password"
      "raycast"
      "alt-tab"
      "vlc"
      "dbeaver-community"
      "nikitabobko/tap/aerospace"

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
