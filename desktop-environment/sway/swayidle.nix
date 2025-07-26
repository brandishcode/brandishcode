{ pkgs, config, ... }:

{
  config = {
    services.swayidle = {
      enable = true;
      timeouts = [
        {
          timeout = 60;
          command = "${pkgs.swaylock}/bin/swaylock -i ${config.theme.wallpaper}";
        }
      ];
    };
  };
}
