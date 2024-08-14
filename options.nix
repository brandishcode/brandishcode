{ lib, ... }:

{
  options = {

    foros = {
      nonnixos = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = ''
          Only for non-nixos distro
        '';
      };
    };

    fordev = {
      lua = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = ''
          Lua development needed
        '';
      };

      cpp = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = ''
          Cpp development needed
        '';
      };

      python = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = ''
          Python development needed
        '';
      };

      graphics = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = ''
          Graphics Development
        '';
      };

    };
  };
}
