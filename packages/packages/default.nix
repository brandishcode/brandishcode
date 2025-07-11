inputs@{ bcpkgs, ... }:

let
  neovim = import ./neovim inputs;
  nixessitycore = bcpkgs.nixessitycore;
in
{
  home.packages = [ neovim nixessitycore ];
}
