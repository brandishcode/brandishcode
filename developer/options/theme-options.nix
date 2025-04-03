{ lib, myTypes, ... }:

{
  options = {
    theme = {
      icons = {
        terminal = lib.mkOption {
          default = "TERMINAL";
          type = myTypes.iconType;
          description = ''
            Terminal icon
          '';
        };
        browser = lib.mkOption {
          default = "BROWSER";
          type = myTypes.iconType;
          description = ''
            Browser icon
          '';
        };
        devBrowser = lib.mkOption {
          default = "DEV-BROWSER";
          type = myTypes.iconType;
          description = ''
            Development Browser icon
          '';
        };
      };
      wallpaper = lib.mkOption {
        default = ./wallpaper/mountain_esborn_pixabay.jpg;
        type = myTypes.wallpaperType;
        description = ''
          Wallpaper image JPEG, PNG
        '';
      };
    };
  };
}
