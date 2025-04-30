{ pkgs, config, lib, ... }:

{
  config = lib.mkIf (config.desktopEnvironment.sway) {
    home-manager.users.${config.username} = {
      programs.waybar = {
        enable = true;
        settings = {
          mainBar = with config.theme.colors; {
            layer = "top";
            position = "bottom";
            height = 10;
            output = [ "DP-2" "DP-1" "HDMI-A-1" ];
            modules-left = [ "sway/workspaces" "sway/mode" "wlr/taskbar" ];
            modules-center = [ "sway/window" ];
            modules-right = [
              "network"
              "clock#paris"
              "clock#manila"
              "clock#tokyo"
              "clock#calendar"
              "clock"
            ];
            "sway/workspaces" = {
              disable-scroll = true;
              all-outputs = true;
            };
            network = {
              format-icons = [ "󰈀" ];
              format = lib.concatStrings [
                ''<span size="large" color="${red}">{icon} </span>''
                ''<span style="oblique" weight="bold">{ifname} </span>''
                "{ipaddr}"
              ];
            };
            clock = {
              format = lib.concatStrings [
                ''<span size="large" color="${yellow}"> </span>''
                "{0:%H:%M}"
                ''
                  <span size="small" rise="-1pt" color="${green}" weight="bold"> {0:%Z}</span>''
              ];
            };
            "clock#calendar" = {
              format = lib.concatStrings [
                ''<span size="large" color="${blue}" weight="bold"> </span>''
                "{0:%Y/%m/%d}"
              ];
            };
            "clock#tokyo" = {
              timezone = "Asia/Tokyo";
              format = lib.concatStrings [
                "{0:%H:%M}"
                ''
                  <span size="small" rise="-1pt" color="${green}" weight="bold"> {0:%Z}</span>''
              ];
            };
            "clock#paris" = {
              timezone = "Europe/Paris";
              format = lib.concatStrings [
                "{0:%H:%M}"
                ''
                  <span size="small" rise="-1pt" color="${green}" weight="bold"> {0:%Z}</span>''
              ];
            };
            "clock#manila" = {
              timezone = "Asia/Manila";
              format = lib.concatStrings [
                "{0:%H:%M}"
                ''
                  <span size="small" rise="-1pt" color="${green}" weight="bold"> {0:%Z}</span>''
              ];
            };

          };
        };
        style = with config.theme.colors; ''
          * {
            font-size: 10px;
          }
          window#waybar {
            background: transparent;
          }
          #clock,
          #network {
            padding: 0 5px 0;
            background: ${background};
            color: ${foreground};
            margin: 0 2px 2px;
          }
        '';
      };
    };
  };
}
