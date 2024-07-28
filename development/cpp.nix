{ config, lib, ... }:

{
  config = {
    home.shellAliases = {
      cmake = lib.mkIf config.fordev.cpp "/usr/bin/cmake";
    };
  };
}

