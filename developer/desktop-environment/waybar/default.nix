{ pkgs, config, lib, ... }:

let
  networkModules = (import ./network.nix {
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
  diskModules = with import ./disk.nix {
    inherit config;
    inherit lib;
  }; {
    "disk#home" = home;
    "disk#development" = development;
    "disk#documents" = documents;
    "disk#root" = root;
  };
  commonModules = {
    network = networkModules.default;
    "clock#calendar" = calendarModules.default;
    "clock" = import ./clock.nix {
      inherit config;
      inherit lib;
    };
  } // pulseaudioModules // diskModules;
in {
  config = lib.mkIf (config.desktopEnvironment.sway) {
    home-manager.users.${config.username} = {
      programs.waybar = {
        enable = true;
        settings = {
          mainBar = {
            layer = "top";
            position = "bottom";
            height = 35;
            output = [ "DP-2" "DP-3" "HDMI-A-1" ];
            modules-left = [ "tray" "pulseaudio" ];
            modules-center = [ "sway/mode" "sway/workspaces" ];
            modules-right = [
              "disk#root"
              "disk#home"
              "disk#development"
              "disk#documents"
              "memory"
              "network"
              "clock#calendar"
              "clock"
            ];
          } // commonModules // workspaceModules // memoryModules;
        };
        style = with config.theme.colors;
          pkgs.replaceVars ./style.css {
            inherit foreground;
            inherit green;
            inherit magenta;
            inherit red;
            # inherit cyan;
          };
      };
    };
  };
}
