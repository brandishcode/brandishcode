{ lib, config, pkgs, ... }:

let
  cpppackage = "clang-tools";
  cppformatter = "clang-format";
in {
  config = {
    programs.nixvim = lib.mkIf config.fordev.cpp {
      extraPackages = [ pkgs.${cpppackage} ];
      plugins.conform-nvim = { formattersByFt = { cpp = [ cppformatter ]; }; };
    };
  };
}
