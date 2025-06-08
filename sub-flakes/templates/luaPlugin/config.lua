require 'lazy'.setup({
  dir = vim.fn.getcwd(),
  config = function()
    require '@moduleName@'.setup()
  end,
})

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>lr', '<cmd>Lazy reload @pname@<cr>')
