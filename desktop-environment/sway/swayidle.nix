{ pkgs, config, ... }:

{
  config = {
    services.swayidle =
      let
        lock = "${pkgs.swaylock}/bin/swaylock -i ${config.theme.wallpaper} --daemonize";
        display = status: "${pkgs.sway}/bin/swaymsg 'output * power ${status}'";
      in
      {
        enable = true;
        timeouts = [
          {
            timeout = 300;
            command = "${pkgs.systemd}/bin/systemctl suspend";
          }
        ];
        events = [
          {
            event = "before-sleep";
            command = (display "off") + "; " + lock;
          }
          {
            event = "after-resume";
            command = display "on";
          }
          {
            event = "lock";
            command = (display "off") + "; " + lock;
          }
          {
            event = "unlock";
            command = display "on";
          }
        ];
      };
  };
}
