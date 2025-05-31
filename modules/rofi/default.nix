{ pkgs, ... }:
let rofi-theme-tokyo-night = (pkgs.callPackage ../../pkgs/rofi-theme.nix { });
in {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi.override { plugins = [ pkgs.rofi-wayland ]; };
    theme =
      "${rofi-theme-tokyo-night}/share/rofi/themes/tokyo-night/tokyonight.rasi";
    extraConfig = {
      modi = "drun,window,run";
      icon-theme = "Papirus-Dark";
      show-icons = true;
      terminal = "foot";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      sidebar-mode = false;
      display-drun = " ";
      display-run = " ";
      display-window = " ";

      kb-row-up = "Up,Control+k";
      kb-row-left = "Left,Control+h";
      kb-row-right = "Right,Control+l";
      kb-row-down = "Down,Control+j";

      kb-accept-entry = "Control+z,Control+y,Return,KP_Enter";

      kb-remove-to-eol = "";
      kb-move-char-back = "Control+b";
      kb-remove-char-back = "BackSpace";
      kb-move-char-forward = "Control+f";
      kb-mode-complete = "Control+o";
    };
  };

  home.packages = [ pkgs.rofi-bluetooth rofi-theme-tokyo-night ];
}
