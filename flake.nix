{
  description = "brandishcode Nixos configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nur.url = "github:nix-community/nur";
    treefmt-nix.url = "github:numtide/treefmt-nix";

    self.submodules = true;
    brandishcode-packages.url = "./brandishcode-packages";
  };

  outputs =
    inputs@{ flake-utils, ... }:
    flake-utils.lib.meld inputs [
      ./sub-flakes/nixos/sub-flake.nix
      ./sub-flakes/formatter/sub-flake.nix
      ./sub-flakes/templates/sub-flake.nix
    ];
}
