{ config, ... }:

# GUI apps are managed via Homebrew casks — nixpkgs support for
# /Applications on macOS is still second-class.

{
  environment.shellInit = ''
    eval "$(${config.homebrew.brewPrefix}/brew shellenv)"
  '';

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    onActivation.upgrade = true;
    global.brewfile = true;

    taps = [ "nikitabobko/tap" ];

    brews = [
      "openssl"
      "qemu"
      "awscli"
    ];

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
      "visual-studio-code"
      "zed"
      "datagrip"
      "intellij-idea"
      "pycharm"
      "insomnia"
      "karabiner-elements"
      "ghostty"
      "claude-code"
      "codex-app"
    ];
  };
}
