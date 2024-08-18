{ lib, ... }:

{
  options = {
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
    };
  };
}
