{ lib, myTypes, ... }:

let
  username = "developer";
in
{
  options = {
    configpath = lib.mkOption {
      default = "nixos-configuration";
      type = lib.types.str;
      description = ''
        NixOS configuration path. Value should be relative to the home folder.
      '';
    };

    user = lib.mkOption {
      default = {
        inherit username;
        email = "${username}@mail.com";
      };
      description = ''
        User details
      '';
      type = myTypes.userType;
    };

    hostname = lib.mkOption {
      default = "nixos";
      type = lib.types.str;
      description = ''
        Nixos hostname
      '';
    };

    nonnixos = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = ''
        Only for non-nixos distro
      '';
    };
  };
}
