{
  globals = {
    mapleader = " ";
  };

  keymaps = [
    {
      mode = "i";
      action = "<Esc>";
      key = "jj";
    }
    {
      mode = "n";
      action = "<Nop>";
      key = "<Space>";
    }
    {
      mode = "n";
      action = "o<Esc>";
      key = "o";
    }
    {
      mode = "n";
      action = "O<Esc>";
      key = "O";
    }
    {
      mode = "n";
      action = "<Cmd>Explore<Cr>";
      key = "<Leader>w";
    }
    {
      mode = "n";
      action = "<Cmd>lua vim.diagnostic.open_float()<Cr>";
      key = "<Leader>vd";
    }
    {
      mode = "n";
      action = "<Cmd>Neorg index<Cr>";
      key = "<Leader>ni";
    }
  ];
}
