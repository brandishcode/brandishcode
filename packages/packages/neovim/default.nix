{ bcpkgs, ... }:

bcpkgs.neovim.override {
  nixessityConfig = {
    projectsdir = "/development";
  };
}
