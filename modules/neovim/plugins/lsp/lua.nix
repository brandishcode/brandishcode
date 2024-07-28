{ config, ... }:

{
  config = {
    programs.nixvim.plugins.lsp.servers.lua-ls = {
      enable = config.fordev.lua;
      settings = { runtime = { builtin = { jit = "enable"; }; }; };
    };
  };
}
