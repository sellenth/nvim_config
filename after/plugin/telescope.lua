-- press the escape key when this event is triggered 'User TelescopeResumePost'
--print "Hello from Lua"
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set("n", "<leader>fa", function()
  require('telescope.builtin').resume()
  vim.defer_fn(function()
    vim.cmd('stopinsert')
  end, 200)
end)
