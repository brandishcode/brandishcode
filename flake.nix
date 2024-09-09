{
  description = "Home Manager configuration of developer";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:brandishcode/nixvim-configuration";
  };

  outputs = { ... }: {
    templates = {
      developer = {
        descrption = ''
          Flake for a graphical set up
        '';
        path = ./developer;
      };
      dev-env-opengl = {
        description = ''
          Flake for opengl development environment
        '';
        path = ./development-environments/opengl;
      };
    };
  };
}
