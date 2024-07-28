{ ... }:

{
  home.username = "developer";
  home.homeDirectory = "/home/developer";

  home.stateVersion = "24.05";

  home.shellAliases = {
    hms = "home-manager switch -b backup --flake ~/nix-configuration/#tui";
  };

  programs = { home-manager.enable = true; };

  imports = [
    ./options.nix
    ./modules/neovim
    ./modules/tmux
    ./modules/git
    ./development
  ];

  # options
  fordev = {
    lua = false;
    cpp = false;
    python = false;
  };
}
