{
  self,
  flake-utils,
  nixpkgs,
  home-manager,
  bcpkgs,
  nur,
  sops-nix,
  ...
}:

flake-utils.lib.eachDefaultSystemPassThrough (
  system:
  let
    inherit ((import ../configurations/user.nix).user) username;
    pkgs = nixpkgs.legacyPackages.${system};
    args = import ../my-args.nix { inherit (pkgs) lib; } // {
      inherit system;
      bcpkgs = bcpkgs.packages.${system};
    };
  in
  {
    # home-manager only configuration in progress
    # homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
    #   inherit pkgs;

    #   # Specify your home configuration modules here, for example,
    #   # the path to your home.nix.
    #   extraSpecialArgs = self.homeModules.home-manager.extraSpecialArgs;
    #   modules = [
    #     {
    #       nix.package = pkgs.nixVersions.nix_2_29;
    #       nixpkgs.overlays = [
    #         nur.overlays.default
    #       ];
    #     }
    #     ../options
    #     ../configurations
    #     ../desktop-environment
    #   ] ++ self.homeModules.home-manager.users.${username}.imports;

    #   # Optionally use extraSpecialArgs
    #   # to pass through arguments to home.nix
    # };
    homeModules = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = args;
      home-manager.sharedModules = [ sops-nix.homeManagerModules.sops ];
      home-manager.users.${username} = {
        imports = [
          ./home.nix
          ./sops.nix
        ];
      };
    };
  }
)
