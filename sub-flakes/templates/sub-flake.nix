{ flake-utils, ... }:

flake-utils.lib.eachDefaultSystemPassThrough (system: {
  templates = {
    luaPlugin = {
      path = ./luaPlugin;
      description = "A luaPlugin flake, with neovim";
    };
  };
})
