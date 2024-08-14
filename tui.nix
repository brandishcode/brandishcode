{ ... }:

{

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
