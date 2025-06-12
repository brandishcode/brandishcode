{
  description = "brandishcode Nixos configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nur.url = "github:nix-community/nur";

    self.submodules = true;
    brandishcode-packages.url = "./brandishcode-packages";
    bcfmt.url = "./brandishcode-formatter";
  };

  outputs =
    inputs@{ flake-utils, ... }:
    flake-utils.lib.meld inputs [
      ./nixos
      ./home-manager
      ./formatter
      ./templates
    ];
}
