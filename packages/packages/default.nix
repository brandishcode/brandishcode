inputs@{ bcpkgs, pkgs, ... }:

let
  neovim = import ./neovim inputs;
  calibre = import ./calibre inputs;
  nixessitycore = bcpkgs.nixessitycore;
in
{
  home.packages = [
    neovim
    nixessitycore
    calibre
    pkgs.protonmail-desktop
  ]
  ++ (with pkgs; [ npins ]);
}
