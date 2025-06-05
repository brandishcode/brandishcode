{ lib, myTypes, ... }:

{
  options = {
    gpu = lib.mkOption {
      default = "amd";
      description = ''
        Graphics Card
      '';
      type = lib.types.str;
    };
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
        List of monitor properties
      '';
    };
  };
}
