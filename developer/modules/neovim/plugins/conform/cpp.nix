{ lib, config, pkgs, ... }:

let
  cpppackage = "clang-tools";
  cppformatter = "clang-format";
  cmakeformatter = "cmake-format";
in {
  config = {
    programs.nixvim = lib.mkIf config.fordev.cpp {
      extraPackages = [ pkgs.${cpppackage} pkgs.${cmakeformatter} ];
      plugins.conform-nvim = {
        formattersByFt = {
          cpp = [ cppformatter ];
          cmake = [ cmakeformatter ];
        };
      };
    };
  };
}
