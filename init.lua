-- ~/.config/nvim for my unix
-- C:/Users/me/.AddData/Local/nvim for my windows
vim.cmd([[
  set completeopt=noinsert,menuone,noselect
  set cursorline
  set inccommand=split
  set mouse=a
  set number
  set relativenumber
  set splitbelow splitright
  set title
  set ttimeoutlen=0
  set wildmenu

  set expandtab
  set shiftwidth=2
  set tabstop=2
  set ignorecase
  set smartcase
  set termguicolors
]])
-- autocmd BufWritePre * lua vim.lsp.buf.format()

vim.g.mapleader = " "
--
-- disable netrw at the very start of your init.lua (for nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Plugins
require("lazy").setup({
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },
  { 'luisiacc/gruvbox-baby',            branch = 'main' },
  { 'github/copilot.vim' },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  { "habamax/vim-godot" },
  { "sindrets/diffview.nvim" }
})

vim.cmd [[colorscheme gruvbox-baby]]

require("treesitter_cfg")
require("telescope_cfg")
require("nvim-tree_cfg")
require("halston")

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "tsserver", "omnisharp", "lua_ls" },
  -- also install gdtoolkit, cant find it above...
  handlers = {
    lsp_zero.default_setup,
  },
})

require 'lspconfig'.gdscript.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  filetypes = { "gd", "gdscript", "gdscript3", "jq" },
}

require 'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}
