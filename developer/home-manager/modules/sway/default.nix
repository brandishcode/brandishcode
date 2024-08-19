{ pkgs, config, lib, ... }:
let
  inherit (import ../common.nix) browser;
  terminal = "foot";
  menu = "wmenu";
in {
  config = {
    home = {
      # Override the nix installed sway by the distro installed package.
      # This is for non-NixOS distros.
      shellAliases = { sway = lib.mkIf config.nonnixos "/usr/bin/sway"; };
      packages = with pkgs; [ pkgs.${menu} wl-clipboard swaybg ];
    };
    programs = { ${browser}.enable = true; };

    wayland.windowManager.sway = {
      enable = true;
      config = {
        modifier = "Mod4";
        terminal = "${config.terminal} -t foot-direct";
        menu = if menu == "wmenu" then "${menu}-run" else menu;
        startup = [
          { command = terminal; }
          {
            command =
              "swaybg -i $(readlink -f /home/${config.username}/${config.configpath}/wallpaper/tokyo-night.png)";
            always = true;
          }
        ];
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
}
