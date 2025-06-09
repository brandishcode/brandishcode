{ nixvim, ... }:

final: prev:
let
  callPackage = package: prev.callPackage (../packages + "/${package}");
in
{
  neovim = callPackage "neovim" {
    inherit nixvim;
  };
}
