vim.api.nvim_set_keymap('n', '<leader>pv', ':lua print("hello")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tc', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tt', ':tab split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>do', ':DiffviewOpen<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dc', ':DiffviewClose<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>co', ':Copilot enable<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>cc', ':Copilot disable<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>w', '<c-w>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Tab>', ':e #<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })


vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end)
--[[
nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
--]]
