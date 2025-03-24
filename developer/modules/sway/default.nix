{ pkgs, config, lib, ... }:
let
  inherit (import ../common.nix) browser;
  modifier = config.wayland.windowManager.sway.config.modifier;
  ws = {
    terminal = "";
    browser = "󰈹";
    dev-browser = "";
  };
in {
  imports = [ ./swayidle.nix ./swaylock.nix ];
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
            output = config.display1;
          }
          {
            workspace = ws.browser;
            output = config.display2;
          }
          {
            workspace = ws.dev-browser;
            output = config.display3;
          }
        ];
        keybindings = lib.mkOptionDefault {
          "${modifier}+0" = "workspace ${ws.terminal}";
          "${modifier}+9" = "workspace ${ws.browser}";
          "${modifier}+8" = "workspace ${ws.dev-browser}";
          "${modifier}+Shift+b" = "exec firefox";
          "${modifier}+Shift+0" = "move window to workspace ${ws.terminal}";
          "${modifier}+Shift+9" = "move window to workspace ${ws.browser}";
          "${modifier}+Shift+8" = "move window to workspace ${ws.dev-browser}";
          "${modifier}+Shift+l" = "exec swaylock";
        };
        assigns = {
          "${ws.browser}" = [{ app_id = "^firefox$"; }];
          "${ws.terminal}" = [{ app_id = "^foot$"; }];
          "${ws.dev-browser}" = [{ app_id = "^chromium-browser$"; }];
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
        output = {
          ${config.display1} = {
            bg = "${../../wallpaper/tokyo-night-horizontal.jpg} fill";
            position = "0,0";
          };
          ${config.display2} = {
            bg = "${../../wallpaper/tokyo-night-horizontal.jpg} fill";
            position = "1920,216";
          };
          ${config.display3} = {
            bg = "${../../wallpaper/tokyo-night-horizontal.jpg} fill";
            position = "0,1080";
          };
        };
      };
    };
  };
}
