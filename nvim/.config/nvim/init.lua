-- Based off kickstart.vim (https://github.com/nvim-lua/kickstart.nvim)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install package manager
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

vim.o.breakindent = true
vim.o.cursorline = true
vim.o.colorcolumn = "80"
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.mouse = "a"
vim.o.smartcase = true
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.undofile = true
vim.o.updatetime = 250
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "yes"

-- Netrw with tree view (<leader>3)
vim.g.netrw_banner=0
vim.g.netrw_browse_split=4
vim.g.netrw_altv=2
vim.g.netrw_liststyle=3

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- load plugins from lua/plugins
require("lazy").setup("plugins")

-- Setup neovim lua configuration
require("neodev").setup()

-- specific settings
require('lsp')
require('keymaps')

-- vim: ts=2 sts=2 sw=2 et
