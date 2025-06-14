{ ... }:

{
  home.username = "developer";
  home.homeDirectory = "/home/developer";
  home.stateVersion = "25.05";
  programs = {
    home-manager.enable = true;
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
  };

  imports = [
    ../packages
    ../environment
  ];
}
