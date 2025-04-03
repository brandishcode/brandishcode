{ lib, myTypes, ... }:
let

in {
  options = {
    desktopEnvironment = {
      sway = lib.mkEnableOption "Sway window manager";
      displayManager = lib.mkOption {
        default = {
          enable = true;
          name = "sddm";
        };
        type = myTypes.displayManagerType;
      };
    };
  };
}
