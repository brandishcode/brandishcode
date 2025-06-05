{
  self,
  flake-utils,
  treefmt-nix,
  ...
}:
flake-utils.lib.eachDefaultSystem (system: {
  formatter = (treefmt-nix.lib.evalModule self.myNixpkgs ./treefmt.nix).config.build.wrapper;
})
