{ pkgs, ... }:

let
  javascriptformatter = "prettierd";
in
{
  extraPackages = [ pkgs.${javascriptformatter} ];
  plugins.lsp.servers.ts_ls.enable = true;
  plugins.conform-nvim = {
    settings.formatters_by_ft = {
      javascript = [ javascriptformatter ];
      typescript = [ javascriptformatter ];
      typescriptreact = [ javascriptformatter ];
      javascriptreact = [ javascriptformatter ];
    };
  };
}
