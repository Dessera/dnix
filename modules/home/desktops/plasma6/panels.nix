{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) types mkIf;
  inherit (config.home) dockApps;

  cfg = config.dnix.desktops.plasma6;
in
{
  # TODO: Move to another file
  options.home.dockApps = lib.mkOption {
    type = types.listOf types.str;
    default = [
      "applications:systemsettings.desktop"
      "applications:org.kde.dolphin.desktop"
      "applications:org.kde.plasma-systemmonitor.desktop"
    ];
  };

  config = mkIf cfg.enable {
    programs.plasma.panels = [
      {
        location = "bottom";
        hiding = "dodgewindows";
        lengthMode = "fit";
        height = 64;
        screen = 0;
        widgets = [
          {
            name = "AndromedaLauncher";
            config.General = {
              favoritesPortedToKAstats = true;
              floating = true;
              icon = "nix-snowflake";
              launcherPosition = 1;
              pinnedModel = 1;
              useCustomButtonImage = false;
              useSystemFontSettings = true;
            };
          }
          {
            iconTasks = {
              launchers = dockApps;
              iconsOnly = false;
              appearance.iconSpacing = "small";
            };
          }
          {
            plasmaPanelColorizer = {
              settings.General = {
                hideWidget = true;
                presetAutoloading = "{\"enabled\":true,\"normal\":\"${pkgs.plasma-panel-colorizer}/share/plasma/plasmoids/luisbocanegra.panel.colorizer/contents/ui/presets/ChromeOS\"}";
              };
            };
          }
          {
            systemTray = {
              items = {
                shown = [
                  "org.kde.plasma.battery"
                  "org.kde.plasma.bluetooth"
                  "org.kde.plasma.volume"
                ];
                hidden = [
                  "org.kde.plasma.networkmanagement"
                  "org.kde.plasma.brightness"
                  "org.kde.plasma.clipboard"
                ];
              };
            };
          }
          {
            digitalClock = {
              date = {
                enable = false;
              };
              calendar = {
                showWeekNumbers = true;
                plugins = [ "holidaysevents" ];
              };
            };
          }
        ];
      }
    ];

    home.packages = with pkgs; [
      plasma-widgets.andromeda-launcher
    ];
  };
}
