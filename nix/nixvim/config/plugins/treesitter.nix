{
  plugins.treesitter = {
    enable = true;
    settings.highlight = {
      enable = true;
    };
  };

  extraConfigVim = ''
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    set nofoldenable
  '';
}
