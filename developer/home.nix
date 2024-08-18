{ pkgs, ... }:

{
  home.username = "developer";
  home.homeDirectory = "/home/developer";

  home.stateVersion = "24.05";

  home.shellAliases = {
    hms = "home-manager switch -b backup --flake ~/nix-configuration/#gui";
  };

  home.packages = with pkgs; [ noto-fonts noto-fonts-cjk noto-fonts-emoji ];

  programs = { home-manager.enable = true; };

  imports =
    [ ./options ./modules/tmux ./modules/git ./modules/firefox ./modules/sway ];
}
