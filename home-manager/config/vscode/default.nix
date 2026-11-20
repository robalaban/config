{
  # VS Code app installed via Homebrew cask (darwin/brew.nix)
  # Settings managed declaratively here
  home.file."Library/Application Support/Code/User/settings.json".text = builtins.toJSON {
    "editor.renderWhitespace" = "all";
    "files.autoSave" = "onFocusChange";
    "editor.rulers" = [
      80
      120
    ];
    "editor.tabSize" = 2;
    "editor.formatOnSave" = true;
    "breadcrumbs.enabled" = true;
    "editor.useTabStops" = false;
    "editor.fontFamily" = "JetBrainsMono Nerd Font";
    "editor.fontSize" = 13;
    "editor.fontLigatures" = true;
    "editor.lineHeight" = 20;
    "files.trimTrailingWhitespace" = true;
    "editor.minimap.enabled" = false;
    "workbench.editor.enablePreview" = false;
    "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font";
    "workbench.fontAliasing" = "antialiased";
    "workbench.colorTheme" = "Dracula";
    "workbench.iconTheme" = "material-icon-theme";
    "editor.inlineSuggest.enabled" = true;
    "workbench.sideBar.location" = "right";
    "search.exclude" = {
      "**/.cache" = true;
      "**/.next" = true;
      "**/coverage" = true;
      "**/dist" = true;
      "**/node_modules" = true;
      "**/target" = true;
    };
    "files.exclude" = {
      "**/.classpath" = true;
      "**/.factorypath" = true;
      "**/.idea" = true;
      "**/.project" = true;
      "**/.settings" = true;
    };
    "github.copilot.enable" = {
      "*" = true;
      "yaml" = false;
      "plaintext" = false;
      "markdown" = true;
    };
    # Disable telemetry / welcome noise (only for extensions actually installed)
    "extensions.ignoreRecommendations" = true;
    "material-icon-theme.showWelcomeMessage" = false;
    "telemetry.telemetryLevel" = "off";
    "terraform.telemetry.enabled" = false;
    "update.showReleaseNotes" = false;
    "workbench.welcomePage.walkthroughs.openOnInstall" = false;
  };
}
