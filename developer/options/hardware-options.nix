{ lib, ... }:
let monitorTypes = (import ./types/monitor-types.nix { inherit lib; });
in {
  options = {
    monitor = with monitorTypes;
      lib.mkOption {
        default = [{
          output = "DP-1";
          position = {
            x = 0;
            y = 0;
          };
          wallpaper = ""; # path to your wallpaper
        }];
        type = monitorTypeList;
        description = ''
          List of monitor properties;
        '';
      };
  };
}
