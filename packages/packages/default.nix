inputs@{ bcpkgs, pkgs, ... }:

let
  neovim = import ./neovim inputs;
  nixessitycore = bcpkgs.nixessitycore;
in
{
  home.packages = [
    neovim
    nixessitycore
  ] ++ (with pkgs; [ npins ]);
}
