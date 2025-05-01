{ pkgs, config, lib, ... }:

let
  networkModules = (import ./network.nix {
    inherit lib;
    inherit config;
  });
  clockModules = (import ./clock.nix {
    inherit lib;
    inherit config;
  });
  calendarModules = (import ./calendar.nix {
    inherit lib;
    inherit config;
  });
  commonModules = {
    network = networkModules.default;
    clock = clockModules.default;
    "clock#calendar" = calendarModules.default;
  };
  countryClockModules = with clockModules; {
    "clock#tokyo" = tokyo;
    "clock#paris" = paris;
    "clock#manila" = manila;
  };
in {
  config = lib.mkIf (config.desktopEnvironment.sway) {
    home-manager.users.${config.username} = {
      programs.waybar = {
        enable = true;
        settings = {
          monitor1Bar = {
            layer = "top";
            position = "bottom";
            height = 35;
            output = [ "DP-2" ];
            modules-left = [ "sway/workspaces" "sway/mode" "wlr/taskbar" ];
            modules-center = [ ];
            modules-right = [
              "network"
              "clock#paris"
              "clock#manila"
              "clock#tokyo"
              "clock#calendar"
              "clock"
            ];
            "sway/workspaces" = { disable-scroll = true; };
          } // commonModules // countryClockModules;
          monitor2Bar = {
            layer = "top";
            position = "bottom";
            height = 35;
            output = [ "DP-3" ];
            modules-left = [ "sway/workspaces" "sway/mode" "wlr/taskbar" ];
            modules-right = [ "network" "clock#calendar" "clock" ];
            "sway/workspaces" = { disable-scroll = true; };
          } // commonModules;
        };
        style = with config.theme.colors;
          pkgs.replaceVars ./style.css { inherit foreground; };
      };
    };
  };
}
