{ pkgs, config, ... }:

let
  desktop-environment = (import ./desktop-environment.nix {
    inherit pkgs;
    icons = config.theme.icons;
    monitor = config.monitor;
  });
  display = (import ./display.nix { wallpaper = config.theme.wallpaper; });
in {
  imports = [ desktop-environment display ];
  gpu = "intel";
}
