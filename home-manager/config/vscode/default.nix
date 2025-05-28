{ config, pkgs, ... }: {
  programs.vscode.profiles.default.userSettings = {
    "editor.renderWhitespace" = "all";
      "files.autoSave" = "onFocusChange";
      "editor.rulers" = [ 80 120 ];
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
      # Disable telemetry + extra
    	"clangd.checkUpdates" = false;
    	"code-runner.enableAppInsights" = false;
    	"docker-explorer.enableTelemetry" = false;
    	"extensions.ignoreRecommendations" = true;
    	"gitlens.showWelcomeOnInstall" = false;
    	"gitlens.showWhatsNewAfterUpgrades" = false;
    	"java.help.firstView" = "none";
    	"java.help.showReleaseNotes" = false;
    	"julia.enableTelemetry" = false;
    	"kite.showWelcomeNotificationOnStartup" = false;
    	"liveServer.settings.donotShowInfoMsg" = true;
    	"Lua.telemetry.enable" = false;
    	"material-icon-theme.showWelcomeMessage" = false;
    	"pros.showWelcomeOnStartup" = false;
    	"pros.useGoogleAnalytics" = false;
    	"redhat.telemetry.enabled" = false;
    	"rpcServer.showStartupMessage" = false;
    	"shellcheck.disableVersionCheck" = true;
    	"sonarlint.disableTelemetry" = true;
    	"telemetry.enableCrashReporter" = false;
    	"telemetry.enableTelemetry" = false;
    	"telemetry.telemetryLevel" = "off";
    	"terraform.telemetry.enabled" = false;
    	"update.showReleaseNotes" = false;
    	"vsicons.dontShowNewVersionMessage" = true;
    	"workbench.welcomePage.walkthroughs.openOnInstall" = false;
  };
}
