{
  description = "Graphical nix configuration";

  inputs = {

    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:brandishcode/nixvim-configuration";
    nur.url = "github:nix-community/nur";
  };

  outputs = { nixpkgs, home-manager, nixvim, nur, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nur.overlay ];
      };
      nixvim' = { home.packages = [ nixvim.packages.${system}.default ]; };
      options = import ./options-definition.nix;
    in {
      homeConfigurations = {
        "${options.username}" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules =
            [ options ./options-declaration.nix ./home-manager nixvim' ];
        };
      };

      nixosConfigurations = {
        "${options.username}@${options.hostname}" = nixpkgs.lib.nixosSystem {
          inherit pkgs;
          modules = [ options ./options-declaration.nix ./system ];
        };
      };
    };
}
