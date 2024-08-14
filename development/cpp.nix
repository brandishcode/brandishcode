{ config, lib, ... }:

{
  config = {
    home.shellAliases = {
      cmake =
        lib.mkIf (config.fordev.cpp && config.foros.nonnixos) "/usr/bin/cmake";
    };
  };
}

