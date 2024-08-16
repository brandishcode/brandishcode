{
  description = "Home Manager configuration of developer";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { ... }: {
    templates = {
      developer = {
        descrption = ''
          Flake for a graphical set up
        '';
        path = ./developer;
      };
    };
  };
}
