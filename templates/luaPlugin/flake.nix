{
  description = "Neovim plugin for springboot cli";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    bcfmt.url = "github:brandishcode/brandishcode-formatter";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      bcfmt,
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
