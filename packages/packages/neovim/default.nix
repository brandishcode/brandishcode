{ bcpkgs, ... }:

bcpkgs.neovim.override {
  nixessityConfig = {
    projectsdir = "/development/nixos/nixos-configuration";
  };
}
