{
  plugins = {
    cmp-nvim-lsp.enable = true;
    cmp = {
      enable = true;
      settings = {
        autoEnableSources = true;
        sources = [ { name = "nvim_lsp"; } ];
        mapping = {
          "<tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<c-n>" = "cmp.mapping.select_next_item()";
          "<c-p>" = "cmp.mapping.select_prev_item()";
          "<c-f>" = "cmp.mapping.scroll_docs(4)";
          "<c-b>" = "cmp.mapping.scroll_docs(-4)";
          "<c-y>" = "cmp.mapping.confirm({ select = true })";
          "<c-space>" = "cmp.mapping(cmp.mapping.complete(), {'i', 'c'})";
        };
      };
    };
  };
}
