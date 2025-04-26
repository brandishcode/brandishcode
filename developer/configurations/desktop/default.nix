{ pkgs, config, ... }:

let
  desktop-environment = (import ./desktop-environment.nix {
    inherit pkgs;
    icons = config.theme.icons;
    monitor = config.monitor;
  });
  display = (import ./display.nix { wallpaper = config.theme.wallpaper; });

in { imports = [ display desktop-environment ]; }
