{ config, ... }:

{
  config = {
    programs.nixvim.plugins.lsp.servers.pyright.enable = config.fordev.python;
  };
}
