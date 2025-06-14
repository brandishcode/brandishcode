{ flake-utils, ... }:

flake-utils.lib.eachDefaultSystemPassThrough (system: {
  templates = {
    nvimPlugin = {
      path = ./nvimPlugin;
      description = "A neovim plugin development shell";
    };
  };
})
