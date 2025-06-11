inputs@{ ... }:

{
  home.packages = [ (import ./neovim inputs) ];
}
