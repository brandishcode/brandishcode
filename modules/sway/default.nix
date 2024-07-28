{ pkgs, ... }:
let
  inherit (import ../common.nix) browser;
  terminal = "foot";
  menu = "wmenu";
in {
  home = {
    # Override the nix installed sway by the distro installed package.
    # This is for non-NixOS distros.
    shellAliases = { sway = "/usr/bin/sway"; };
    packages = with pkgs; [ pkgs.${menu} wl-clipboard ];
  };
  programs = {
    ${browser}.enable = true;
    ${terminal}.enable = true;
  };

  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      inherit terminal;
      menu = if menu == "wmenu" then "${menu}-run" else menu;
      startup = [{ command = terminal; }];
    };
  };
}
