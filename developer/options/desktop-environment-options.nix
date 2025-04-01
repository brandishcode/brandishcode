{ lib, ... }:
let
  displayManagerTypes =
    (import ./types/display-manager-types.nix { inherit lib; });
in {
  options = {
    desktopEnvironment = with displayManagerTypes; {
      sway = lib.mkEnableOption "Sway window manager";
      displayManager = lib.mkOption {
        default = "sddm";
        type = displayManagerType;
      };
    };
  };
}
