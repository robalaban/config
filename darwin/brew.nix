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

    # Homebrew 6+ refuses untrusted third-party taps; nix-darwin marks them
    # `trusted: true` in the Brewfile and brew records that in ~/.homebrew/trust.json
    # (which must stay a regular, brew-writable file — don't manage it with home-manager).
    taps = [
      {
        name = "nikitabobko/tap";
        trusted = true;
      }
    ];

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
      "claude-code@latest"
      "codex"
      "codex-app"
    ];
  };
}
