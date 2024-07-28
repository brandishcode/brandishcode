{ config, ... }:

{
  config = {
    programs.nixvim.plugins.lsp.servers = {
      clangd.enable = config.fordev.cpp;
      cmake.enable = config.fordev.cpp;
    };
  };
}
