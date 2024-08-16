{
  description = "Graphical nix configuration";

  inputs = {

    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixvim, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      nixvimModule = nixvim.homeManagerModules.nixvim;
      options = {
        foros = {
          username = "developer";
          nonnixos = false;
        };
        fordev = {
          lua = false;
          cpp = true;
          python = false;
        };
      };
    in {
      homeConfigurations = {
        "${options.foros.username}" =
          home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [ nixvimModule options ./home.nix ];
          };
      };
    };
}
