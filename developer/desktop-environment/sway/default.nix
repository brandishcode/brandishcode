{ pkgs, config, lib, ... }: {
  config = lib.mkIf (config.desktopEnvironment.sway) {
    security.polkit.enable = true;
    home-manager.users.${config.username} = {
      imports = [ ./display.nix ./swayidle.nix ./swaylock.nix ];
      home = {
        # Override the nix installed sway by the distro installed package.
        # This is for non-NixOS distros.
        shellAliases = { sway = lib.mkIf config.nonnixos "/usr/bin/sway"; };
        packages = with pkgs; [ wl-clipboard swaybg ];
      };
      wayland.windowManager.sway = let
        workspaceIcons = config.theme.icons;
        modifier = "Mod4";
      in {
        enable = true;
        config = {
          inherit modifier;
          keybindings = lib.mkOptionDefault {
            "${modifier}+0" = "workspace ${workspaceIcons.terminal}";
            "${modifier}+9" = "workspace ${workspaceIcons.browser}";
            "${modifier}+8" = "workspace ${workspaceIcons.devBrowser}";
            "${modifier}+Shift+b" = "exec firefox";
            "${modifier}+Shift+0" =
              "move window to workspace ${workspaceIcons.terminal}";
            "${modifier}+Shift+9" =
              "move window to workspace ${workspaceIcons.browser}";
            "${modifier}+Shift+8" =
              "move window to workspace ${workspaceIcons.devBrowser}";
            "${modifier}+Shift+l" = "exec swaylock";
          };
          assigns = {
            "${workspaceIcons.browser}" = [{ app_id = "^firefox$"; }];
            "${workspaceIcons.terminal}" = [{ app_id = "^foot$"; }];
            "${workspaceIcons.devBrowser}" =
              [{ app_id = "^chromium-browser$"; }];
          };
          terminal = "${config.terminal} -t foot-direct";
          menu = "rofi -show drun";
          # floating.criteria = [{ class = "install4j-jclient-LoginFrame"; }];
          colors = with config.color; {
            focused = {
              border = blue;
              background = brightblack;
              text = brightwhite;
              indicator = cyan;
              childBorder = blue;
            };
            focusedInactive = {
              border = blue;
              background = brightblack;
              text = brightwhite;
              indicator = cyan;
              childBorder = blue;
            };
            unfocused = {
              border = brightblack;
              background = black;
              text = white;
              indicator = cyan;
              childBorder = brightblack;
            };
            urgent = {
              border = yellow;
              background = yellow;
              text = black;
              indicator = cyan;
              childBorder = yellow;
            };
          };
        };
      };
    };
  };
}
