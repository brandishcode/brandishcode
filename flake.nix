{
  description = "brandishcode Nixos configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:brandishcode/nixvim-configuration";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/nur";
    lix-module = {
      url =
        "https://git.lix.systems/lix-project/nixos-module/archive/2.93.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, flake-utils, home-manager, nixvim, nur, lix-module, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ nur.overlays.default ];
        };
        nixvim' = {
          home.packages = [
            (nixvim.packages.${system}.default.extend {
              imports = [ nixvim.nixvim-configs.${system}.js ];
            })
          ];
        };
        username = "developer";
        home-manager-options = {
          username = username;
          homeDirectory = "/home/${username}";
          stateVersion = "24.11";
        };
        myArgs = import ./my-args.nix { inherit (pkgs) lib; };
      in {
        packages = {
          nixosConfigurations = {
            "${username}" = nixpkgs.lib.nixosSystem {
              inherit pkgs;
              modules = [
                lix-module.nixosModules.default
                { _module.args = myArgs; }
                home-manager.nixosModules.home-manager
                ./options
                ./configurations
                ./system
                ./desktop-environment
                {
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;
                  home-manager.extraSpecialArgs = { inherit system; } // myArgs;
                  # home-manager setup
                  home-manager.users.${username} = {
                    home.stateVersion = home-manager-options.stateVersion;
                    imports = [ ./home-manager nixvim' ];
                  };
                }
              ];
            };
          };
        };
      });
}
