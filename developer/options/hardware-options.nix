{ lib, myTypes, ... }:

{
  options = {
    monitor = lib.mkOption {
      default = [{
        output = "DP-1";
        position = {
          x = 0;
          y = 0;
        };
        wallpaper = ""; # path to your wallpaper
      }];
      type = lib.types.listOf myTypes.monitorType;
      description = ''
        List of monitor properties;
      '';
    };
  };
}
