{
  description = "Neovim plugin for springboot cli";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      treefmt-nix,
      neovim-nightly-overlay,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        pname = "myplugin.nvim";
        lua = pkgs.lua5_4;
        neovim = neovim-nightly-overlay.packages.${system}.default;
      in
      {
        treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
        formatter = self.treefmtEval.${system}.config.build.wrapper;
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
