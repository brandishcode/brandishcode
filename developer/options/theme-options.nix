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
      colors = lib.mkOption {
        default = {
          background = "#1a1b26";
          foreground = "#c0caf5";
          black = "#414868";
          red = "#f7768e";
          green = "#9ece6a";
          yellow = "#e0af68";
          blue = "#7aa2f7";
          magenta = "#bb9af7";
          cyan = "#7dcfff";
          white = "#a9b1d6";
          brightblack = "#414868";
          brightred = "#f7768e";
          brightgreen = "#9ece6a";
          brightyellow = "#e0af68";
          brightblue = "#7aa2f7";
          brightmagenta = "#bb9af7";
          brightcyan = "#7dcfff";
          brightwhite = "#c0caf5";
        };
        type = lib.types.attrs;
        description = ''
          16-bit color scheme, with foreground and background
        '';
      };
    };
  };
}
