{
  self,
  flake-utils,
  nixpkgs,
  lix-module,
  home-manager,
  nixvim,
  ...
}:

flake-utils.lib.eachDefaultSystemPassThrough (
  system:
  let
    nixvim' = {
      home.packages = [
        (nixvim.packages.${system}.default.extend {
          imports = [ nixvim.nixvim-configs.${system}.js ];
        })
      ];
    };
    inherit ((import ../configurations/user.nix).user) username;
    args = import ../my-args.nix { inherit (self.pkgs) lib; } // {
      inherit system;
    };
  in
  {
    nixosConfigurations = {
      "${username}" = nixpkgs.lib.nixosSystem {
        pkgs = self.pkgs;
        modules = [
          lix-module.nixosModules.default
          { _module.args = args; }
          home-manager.nixosModules.home-manager
          ../options
          ../configurations
          ../system
          ../desktop-environment
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = args;
            # home-manager setup
            home-manager.users.${username} = {
              home.stateVersion = "24.11";
              imports = [
                ../home-manager
                nixvim'
              ];
            };
          }
        ];
      };
    };
  }
)
