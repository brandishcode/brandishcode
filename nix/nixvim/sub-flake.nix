{
  flake-utils,
  nixpkgs,
  nixvim,
  ...
}:

flake-utils.lib.eachDefaultSystem (
  system:
  let
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    packages.default = pkgs.callPackage ./. {
      inherit nixvim;
    };
  }
)
