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
            modules-right = [ "temperature" "clock" ];

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
        # style = with config.theme.colors; ''
        #   window#waybar {
        #     border: 1px solid ${blue};
        #     padding-left: 2px;
        #     padding-right: 2px;
        #     background: ${background};
        #     color: ${foreground};
        #   }
        # '';
      };
    };
  };
}
