{ pkgs, config, ... }:

{
  config = {
    services.swayidle = {
      enable = true;
      timeouts = [
        {
          timeout = 600;
          command = "${pkgs.swaylock}/bin/swaylock -i ${config.theme.wallpaper}";
        }
        {
          timeout = 3600;
          command = "systemctl suspend";
        }
      ];
    };
  };
}
