{
  description = "Home Manager configuration of developer";

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
        foros = { nonnixos = true; };
        fordev = {
          lua = false;
          cpp = false;
          python = false;
        };
      };
    in {

      homeConfigurations = {
        "tui" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ nixvimModule options ./tui.nix ];
        };

        "gui" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ nixvimModule options ./gui.nix ];
        };
      };
    };
}
