{
  self,
  flake-utils,
  nixpkgs,
  nur,
  home-manager,
  ...
}:

flake-utils.lib.eachDefaultSystemPassThrough (
  system:
  let
    inherit ((import ../configurations/user.nix).user) username;
    pkgs = nixpkgs.legacyPackages.${system};
    args = import ../my-args.nix { inherit (pkgs) lib; } // {
      inherit system;
    };
  in
  {
    nixosConfigurations = {
      "${username}" = nixpkgs.lib.nixosSystem {
        modules = [
          {
            nix.package = pkgs.nixVersions.nix_2_29;
            nixpkgs.overlays = [
              nur.overlays.default
            ];
            nixpkgs.config.allowUnfree = true;
          }
          { _module.args = args; }
          home-manager.nixosModules.home-manager
          ../options
          ../configurations
          ../system
          ../desktop-environment
          self.homeModules
          # {
          #   home-manager.useGlobalPkgs = true;
          #   home-manager.useUserPackages = true;
          #   home-manager.extraSpecialArgs = args;
          #   home-manager.users.${username} = {
          #     home.stateVersion = "25.05";
          #     imports = [
          #       ../home-manager
          #     ];
          #   };
          # }
        ];
      };
    };
  }
)
