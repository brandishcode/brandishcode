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
)
