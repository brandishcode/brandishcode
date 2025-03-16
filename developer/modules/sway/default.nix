{ pkgs, config, lib, ... }:
let
  inherit (import ../common.nix) browser;
  terminal = "foot";
  modifier = config.wayland.windowManager.sway.config.modifier;
  ws = {
    terminal = "";
    browser = "󰈹";
  };
in {
  config = {
    home = {
      # Override the nix installed sway by the distro installed package.
      # This is for non-NixOS distros.
      shellAliases = { sway = lib.mkIf config.nonnixos "/usr/bin/sway"; };
      packages = with pkgs; [ wl-clipboard swaybg ];
    };
    programs = { ${browser}.enable = true; };

    wayland.windowManager.sway = {
      enable = true;
      config = {
        modifier = "Mod4";
        workspaceOutputAssign = [
          {
            workspace = ws.terminal;
            output = config.display2;
          }
          {
            workspace = ws.browser;
            output = config.display1;
          }
        ];
        keybindings = lib.mkOptionDefault {
          "${modifier}+0" = "workspace ${ws.terminal}";
          "${modifier}+9" = "workspace ${ws.browser}";
          "${modifier}+Shift+b" = "exec firefox";
          "${modifier}+Shift+0" = "move window to workspace ${ws.terminal}";
          "${modifier}+Shift+9" = "move window to workspace ${ws.browser}";
        };
        assigns = { "${ws.browser}" = [{ app_id = "^firefox$"; }]; };
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
        output = {
          ${config.display1} = {
            bg = "${../../wallpaper/tokyo-night-vertical.jpg} fill";
            position = "1920,0";
          };
          ${config.display2} = {
            bg = "${../../wallpaper/tokyo-night-horizontal.jpg} fill";
            position = "0,0";
          };
        };
      };
    };
  };
}
