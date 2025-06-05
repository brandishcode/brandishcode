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
    {
      self,
      nixpkgs,
      flake-utils,
      home-manager,
      nixvim,
      nur,
      lix-module,
      treefmt-nix,
    }:
    flake-utils.lib.eachDefaultSystemPassThrough (system: {
      myNixpkgs = import nixpkgs {
        inherit system;
        overlays = [ nur.overlays.default ];
      };
      myArgs = import ./my-args.nix { inherit (self.myNixpkgs) lib; } // {
        inherit system;
      };
    })
    // flake-utils.lib.eachDefaultSystem (system: {
      formatter = (treefmt-nix.lib.evalModule self.myNixpkgs ./treefmt.nix).config.build.wrapper;
    })
    // flake-utils.lib.eachDefaultSystemPassThrough (
      system:
      let
        nixvim' = {
          home.packages = [
            (nixvim.packages.${system}.default.extend {
              imports = [ nixvim.nixvim-configs.${system}.js ];
            })
          ];
        };
        username = "developer";
      in
      {
        nixosConfigurations = {
          "${username}" = nixpkgs.lib.nixosSystem {
            pkgs = self.myNixpkgs;
            modules = [
              lix-module.nixosModules.default
              { _module.args = self.myArgs; }
              home-manager.nixosModules.home-manager
              ./options
              ./configurations
              ./system
              ./desktop-environment
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = self.myArgs;
                # home-manager setup
                home-manager.users.${username} = {
                  home.stateVersion = "24.11";
                  imports = [
                    ./home-manager
                    nixvim'
                  ];
                };
              }
            ];
          };
        };
      }
    );
}
