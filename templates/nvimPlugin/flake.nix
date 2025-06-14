{
  description = "Neovim plugin development shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    bcfmt.url = "github:brandishcode/brandishcode-formatter";
    bcpkgs.url = "github:brandishcode/brandishcode-packages";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      bcfmt,
      bcpkgs,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        pname = "myplugin.nvim";
        lua = pkgs.lua5_4;
        neovim = bcpkgs.packages.${system}.neovim;
      in
      {
        formatter = bcfmt.formatter.${system};
        checks = {
          formatting = self.treefmtEval.${system}.config.build.check self;
        };
        devShells = {
          default = pkgs.callPackage ./. {
            inherit pname lua neovim;
          };
        };
      }
    );
}
