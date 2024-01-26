vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<leader>pv', ':lua print("hello")<CR>', {noremap = true, silent = true})
