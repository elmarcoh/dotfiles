-- Mostly clean and pluginless NeoVIM config
local g = vim.g
g.mapleader = " "

-- Netrw with tree view
g.netrw_banner = 0
g.netrw_browse_split = 4
g.netrw_altv = 2
g.netrw_liststyle = 3

local o = vim.opt
o.title = true

vim.cmd("set path+=**")

o.backup = false
o.compatible = false
o.cursorline = true
o.mouse = "a"
o.number = true
o.relativenumber = true
o.syntax = "ON"
o.wrap = false
o.colorcolumn = "80"
o.timeout = true
o.timeoutlen = 300

o.hlsearch = false
o.ignorecase = true
o.smartcase = true
o.incsearch = true

o.tabstop = 4
o.shiftwidth = 4
o.expandtab = false
o.smartindent = true

o.fileencoding = "utf-8"
o.pumheight = 10
o.showtabline = 2
o.laststatus = 2
o.cmdheight = 2
o.signcolumn = "auto"
o.showcmd = true
o.showmode = true
o.scrolloff = 8
o.completeopt = { "menuone", "noselect" }
o.splitbelow = true
o.splitright = true
o.termguicolors = true

vim.cmd("filetype plugin on")
vim.cmd("set wildmenu")

-- reload this file on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "init.lua" },
	callback = function(ev)
		vim.cmd("source %:p")
	end,
})

function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- buffer nav
map("n", "<tab>", ":bn<cr>")
map("n", "<leader>bd", ":bd<cr>")

map("n", "<leader>v", ":vsplit")
map("n", "<leader>s", ":slit")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- scroll remap to keep line in center
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- autoclose pairs
map("i", "''", "''<left>")
map("i", '""', '""<left>')
map("i", "()", "()<left>")
map("i", "[]", "[]<left>")
map("i", "{}", "{}<left>")

-- open file explorer
map("n", "<leader>e", ":25Lex<cr>")

-- replace
map("v", "<leader>r", ":%s/<C-r>h//gc<left><left><left>")

map("v", "J", ":m '>+1<cr>gv=gv")
map("v", "K", ":m '>-2<cr>gv=gv")
