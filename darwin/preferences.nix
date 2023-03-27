{ ... }:

let homeDir = "/Users/robert";
in {
  system.activationScripts.postActivation.text = ''
    # Stop iTunes from responding to the keyboard media keys
    launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2>/dev/null

    # Use list view in all Finder windows by default
    # Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
    defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
  '';

  system.defaults = {
    dock = {
      mru-spaces = false;
      tilesize = 22;
      orientation = "left";
    };

    screencapture.location = "${homeDir}/Desktop";

    finder = {
      AppleShowAllExtensions = true;
      _FXShowPosixPathInTitle = true;
      FXEnableExtensionChangeWarning = false;
    };

    trackpad = {
      Clicking = true;
      TrackpadThreeFingerDrag = false;
      TrackpadRightClick = true;
    };

    NSGlobalDomain = {
      AppleFontSmoothing = 1;
      ApplePressAndHoldEnabled = true;
      AppleKeyboardUIMode = 3;
      AppleMeasurementUnits = "Centimeters";
      AppleMetricUnits = 1;
      AppleShowScrollBars = "Automatic";
      AppleShowAllExtensions = true;
      AppleTemperatureUnit = "Celsius";
      # InitialKeyRepeat                     = 15;
      KeyRepeat = 2;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      # auto hide menu bar on top
      _HIHideMenuBar = false;
    };
  };
}
