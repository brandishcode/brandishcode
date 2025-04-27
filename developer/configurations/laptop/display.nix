{ wallpaper }:

{
  monitor = [
    {
      output = "DP-1";
      inherit wallpaper;
      position = {
        x = 0;
        y = 0;
      };
    }
    {
      output = "eDP-1";
      inherit wallpaper;
      position = {
        x = 1920;
        y = 0;
      };
    }
    # {
    #   output = "eDP-1";
    #   inherit wallpaper;
    #   position = {
    #     x = 0;
    #     y = 0;
    #   };
    # }
  ];
}
