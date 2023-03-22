{ config, pkgs, ... }: {
  programs.vscode = {
    enable = true;
    userSettings = {
      "editor.renderWhitespace" = "all";
      "files.autoSave" = "onFocusChange";
      "editor.rulers" = [ 80 120 ];
      "telemetry.telemetryLevel" = "off";
      "editor.tabSize" = 2;
      "files.exclude" = { "**/node_modules/**" = true; };
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
    };
  };
}
