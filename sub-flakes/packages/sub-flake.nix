{
  self,
  flake-utils,
  nixpkgs,
  nixvim,
  ...
}:

flake-utils.lib.eachDefaultSystem (
  system:
  let
    pkgs = nixpkgs.legacyPackages.${system};
    overlays = (import ../overlays { inherit nixvim; }) self pkgs;
  in
  {
    packages = {
      default = overlays.neovim;
    } // overlays;
  }
)
