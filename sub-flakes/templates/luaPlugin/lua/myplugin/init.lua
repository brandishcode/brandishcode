local M = {}

function M.setup()
  vim.api.nvim_create_user_command('MyPluginCmd', function()
    print 'MyPluginCmd works'
  end, { desc = 'MyPlugin Command' })
end

return M
