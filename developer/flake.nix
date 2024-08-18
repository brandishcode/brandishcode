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
  };

  outputs = { nixpkgs, home-manager, nixvim, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      nixvim' = { home.packages = [ nixvim.packages.${system}.default ]; };
      options = {
        configpath = "";
        username = "developer";
        hostname = "nixos";
        nonnixos = false;
        git.username = "";
        git.useremail = "";
        git.token = "";
        terminal = "foot";
      };
    in {
      homeConfigurations = {
        "${options.username}" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ options ./home.nix nixvim' ];
        };
      };

      nixosConfigurations = {
        "${options.username}@${options.hostname}" = nixpkgs.lib.nixosSystem {
          inherit pkgs;
          modules = [ options ./configuration.nix ];
        };
      };
    };
}
