local moduleName = '@moduleName@'
local dir = vim.fn.getcwd()
vim.opt.rtp:append(dir)
require(moduleName).setup()

vim.g.mapleader = ' '
vim.api.nvim_create_user_command('ReloadPlugin', function()
  package.loaded[moduleName] = nil
  require(moduleName).setup()
end, { desc = 'Reload this plugin' })
vim.keymap.set('n', '<leader>lr', '<cmd>ReloadPlugin<cr>')
