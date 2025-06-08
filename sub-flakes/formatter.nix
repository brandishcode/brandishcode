{
  nixpkgs,
  flake-utils,
  treefmt-nix,
  ...
}:
let
  treefmt = {
    settings.verbose = 1;
    projectRootFile = ".git/config";
    programs.nixfmt.enable = true;
  };
in
flake-utils.lib.eachDefaultSystem (system: {
  formatter =
    (treefmt-nix.lib.evalModule nixpkgs.legacyPackages.${system} treefmt).config.build.wrapper;
})
