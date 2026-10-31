{ wallpaper }:

{
  monitor = [
    {
      output = "DP-2";
      inherit wallpaper;
      position = {
        x = 1080;
        y = 480;
      };
      transform = "normal";
    }
    {
      output = "DP-3";
      inherit wallpaper;
      position = {
        x = 0;
        y = 0;
      };
      transform = "90";
    }
    {
      output = "HDMI-A-1";
      inherit wallpaper;
      position = {
        x = 0;
        y = 1080;
      };
      transform = "normal";
    }
  ];
}
