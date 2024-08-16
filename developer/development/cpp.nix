{ config, lib, ... }:

{
  config = {
    home = {
      # packages = with pkgs; lib.mkIf config.fordev.cpp [ cmake ];
      shellAliases = {
        cmake = lib.mkIf (config.fordev.cpp && config.foros.nonnixos)
          "/usr/bin/cmake";
      };
    };
  };
}

