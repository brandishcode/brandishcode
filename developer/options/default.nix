{ lib, ... }:

{
  options = {
    configpath = lib.mkOption {
      default = "nixos-configuration";
      type = lib.types.str;
      description = ''
        NixOS configuration path. Value should be relative to the home folder.
      '';
    };

    username = lib.mkOption {
      default = "developer";
      type = lib.types.str;
      description = ''
        Distro username
      '';
    };

    hostname = lib.mkOption {
      default = "nixos";
      type = lib.types.str;
      description = ''
        Nixos hostname
      '';
    };

    nonnixos = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = ''
        Only for non-nixos distro
      '';
    };

    terminal = lib.mkOption {
      default = "foot";
      type = lib.types.str;
      description = ''
        Terminal
      '';
    };

    git = {
      username = lib.mkOption {
        default = "brandishcode";
        type = lib.types.str;
        description = ''
          Git username
        '';
      };
      useremail = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = ''
          Git username
        '';
      };
      token = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = ''
          Github CLI token (Github access token)
        '';
      };
    };
  };
}
