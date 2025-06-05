{
  description = "brandishcode Nixos configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:brandishcode/nixvim-configuration";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    nur.url = "github:nix-community/nur";
    lix-module.url = "https://git.lix.systems/lix-project/nixos-module/archive/2.93.0.tar.gz";
    lix-module.inputs.nixpkgs.follows = "nixpkgs";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-utils,
      nur,
      ...
    }:
    flake-utils.lib.meld inputs [
      ./nixos-configuration.nix
      ./formatter-configuration.nix
    ]
    // flake-utils.lib.eachDefaultSystemPassThrough (system: {
      myNixpkgs = import nixpkgs {
        inherit system;
        overlays = [ nur.overlays.default ];
      };
      myArgs = import ./my-args.nix { inherit (self.myNixpkgs) lib; } // {
        inherit system;
      };
    });
}
