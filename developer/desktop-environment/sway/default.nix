{ pkgs, config, lib, ... }:

{
  config = lib.mkIf (config.desktopEnvironment.sway) {
    security.polkit.enable = true;
    home-manager.users.${config.username} = {
      imports =
        [ ./display.nix ./keybinding.nix ./swayidle.nix ./swaylock.nix ];
      home = {
        # Override the nix installed sway by the distro installed package.
        # This is for non-NixOS distros.
        shellAliases = { sway = lib.mkIf config.nonnixos "/usr/bin/sway"; };
        packages = with pkgs; [ wl-clipboard swaybg ];
      };
      wayland.windowManager.sway = let workspaceIcons = config.theme.icons;
      in {
        enable = true;
        config = {
          # assigns = {
          #   "${workspaceIcons.browser}" = [{ app_id = "^firefox$"; }];
          #   "${workspaceIcons.terminal}" = [{ app_id = "^foot$"; }];
          #   "${workspaceIcons.devBrowser}" =
          #     [{ app_id = "^chromium-browser$"; }];
          # };
          startup = [
            { command = "fcitx5"; }
            {
              command =
                "--no-startup-id swaymsg 'workspace 0; exec foot --app-id main-foot'";
            }
            {
              command = ''
                --no-startup-id swaymsg "workspace 1; exec firefox --name firefox-youtube --no-remote -P youtube https://www.youtube.com"'';
            }
            {
              command = ''
                --no-startup-id swaymsg "workspace 9; exec firefox --name firefox-surf --no-remote"'';
            }
          ];
          terminal = "${config.terminal} -t foot-direct";
          menu = "rofi -show drun";
          colors = (import ./theme.nix { inherit config; });
          bars = [{ command = "${pkgs.waybar}/bin/waybar"; }];
          gaps.outer = 2;
        };
        # extraConfig = ''
        #   default_border none
        # '';
      };
    };
  };
}
