{ lib, ... }:

{
  options = {
    musicDirectory = lib.mkOption {
      default = "/documents/nixos/music";
      type = lib.types.str;
      description = ''
        Music Directory for MPD
      '';
    };
  };
}
