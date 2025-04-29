{ pkgs, config, lib, ... }:

{
  config = lib.mkIf (config.desktopEnvironment.sway) {
    home-manager.users.${config.username} = {
      programs.waybar = {
        enable = true;
        settings = {
          mainBar = {
            layer = "top";
            position = "bottom";
            output = [ "DP-2" "DP-3" "HDMI-A-1" ];
            modules-left = [ "sway/workspaces" "sway/mode" "wlr/taskbar" ];
            modules-center = [ "sway/window" ];
            modules-right = [ "network" "temperature" "clock" ];

            "sway/workspaces" = {
              disable-scroll = true;
              all-outputs = true;
            };
            # "custom/hello-from-waybar" = {
            #   format = "hello {}";
            #   max-length = 40;
            #   interval = "once";
            #   exec = pkgs.writeShellScript "hello-from-waybar" ''
            #     echo "from within waybar"
            #   '';
            # };
          };
        };
        style = with config.theme.colors; ''
          #temperature {
            background: ${green};
            color: ${black};
          }
          #network {
            background: ${blue};
            color: ${black};
          }
        '';
      };
    };
  };
}
