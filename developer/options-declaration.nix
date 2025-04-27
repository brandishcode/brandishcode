{ lib, ... }:

{
  options = {
    systemd-boot-entry1 = lib.mkOption {
      default = { };
      type = lib.types.attrs;
      description = ''
        systemd-boot entry for other os
      '';
    };

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

    git = lib.mkOption {
      default = {
        username = "brandishcode";
        useremail = "";
        token = "";
      };
      description = ''
        Git options
      '';
    };

    musicDirectory = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = ''
        Music Directory for MPD
      '';
    };
  };
}
