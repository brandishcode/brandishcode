{ lib, ... }:
let
  desktopEnvironmentTypes =
    (import ./types/desktop-environment-types.nix { inherit lib; });
in {
  options = {
    desktopEnvironment = {
      enable = lib.mkEnableOption "Desktop Environment";
      app = with desktopEnvironmentTypes;
        lib.mkOption {
          default = "sway";
          type = desktopEnvironmentType;
          description = ''
            Which desktop environment to use;
          '';
        };
    };
  };
}
