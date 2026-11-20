{ config, ... }:

let
  homeDir = config.users.users.${config.system.primaryUser}.home;
in
{
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
      # List view in all Finder windows by default
      FXPreferredViewStyle = "Nlsv";
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
