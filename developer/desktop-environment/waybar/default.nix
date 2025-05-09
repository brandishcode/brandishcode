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
  workspaceModules = { "sway/workspaces" = (import ./workspace.nix).default; };
  memoryModules = {
    memory = (import ./memory.nix {
      inherit lib;
      inherit config;
    }).default;
  };
  # backlightModules = {
  #   backlight = (import ./backlight.nix {
  #     inherit config;
  #     inherit lib;
  #   });
  # };
  backlightModules = { };
  pulseaudioModules = {
    pulseaudio = import ./pulseaudio.nix {
      inherit config;
      inherit lib;
    };
  };
  commonModules = {
    network = networkModules.default;
    "clock#calendar" = calendarModules.default;
  } // pulseaudioModules;
  countryClockModules = with clockModules; {
    "clock#tokyo" = tokyo;
    "clock#paris" = paris;
    "clock#manila" = manila;
    "clock#newyork" = newyork;
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
            modules-left = [ "pulseaudio" ];
            modules-center = [ "sway/mode" "sway/workspaces" ];
            modules-right = [
              "memory"
              "network"
              "clock#newyork"
              "clock#paris"
              "clock#manila"
              "clock#tokyo"
              "clock#calendar"
            ];
          } // commonModules // countryClockModules // workspaceModules
            // memoryModules;
          monitor2Bar = {
            layer = "top";
            position = "bottom";
            height = 35;
            output = [ "DP-3" ];
            modules-left = [ "pulseaudio" ];
            modules-center = [ "sway/mode" "sway/workspaces" ];
            modules-right = [ "memory" "network" "clock#calendar" ];
          } // commonModules // workspaceModules // memoryModules
            // backlightModules;
        };
        style = with config.theme.colors;
          pkgs.replaceVars ./style.css {
            inherit foreground;
            inherit green;
            inherit magenta;
          };
      };
    };
  };
}
