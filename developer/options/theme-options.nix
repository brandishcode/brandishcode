{ lib, ... }:

let
  inherit (import ./types/theme-types.nix { inherit lib; })
    iconType wallpaperType;
in {
  options = {
    theme = {
      icons = {
        terminal = lib.mkOption {
          default = "TERMINAL";
          type = iconType;
          description = ''
            Terminal icon
          '';
        };
        browser = lib.mkOption {
          default = "BROWSER";
          type = iconType;
          description = ''
            Browser icon
          '';
        };
        devBrowser = lib.mkOption {
          default = "DEV-BROWSER";
          type = iconType;
          description = ''
            Development Browser icon
          '';
        };
      };
      wallpaper = lib.mkOption {
        default = ./wallpaper/mountain_esborn_pixabay.jpg;
        type = wallpaperType;
        description = ''
          Wallpaper image JPEG, PNG
        '';
      };
    };
  };
}
