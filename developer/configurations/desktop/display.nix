let
  theme = (import ../theme.nix).theme;
  wallpaper = theme.wallpaper;
in {
  monitor = [
    {
      output = "DP-2";
      inherit wallpaper;
      position = {
        x = 0;
        y = 0;
      };
    }
    {
      output = "DP-3";
      inherit wallpaper;
      position = {
        x = 1920;
        y = 216;
      };
    }
    {
      output = "HDMI-A-1";
      inherit wallpaper;
      position = {
        x = 0;
        y = 1080;
      };
    }
  ];
}
