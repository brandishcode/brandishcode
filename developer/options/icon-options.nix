{ lib, ... }:

let inherit (import ./types/font-types.nix { inherit lib; }) iconType;
in {
  options = {
    icons = {
      terminal = lib.mkOption {
        default = "TERMINAL";
        type = iconType;
        description = ''
          Terminal icon
        '';
      };
      browser = lib.mkOption {
        default = "BROWSER";
        type = iconType;
        description = ''
          Browser icon
        '';
      };
      devBrowser = lib.mkOption {
        default = "DEV-BROWSER";
        type = iconType;
        description = ''
          Development Browser icon
        '';
      };
    };
  };
}
