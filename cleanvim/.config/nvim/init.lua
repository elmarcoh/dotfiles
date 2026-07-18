local g = vim.g
local o = vim.opt

g.mapleader = " "
o.termguicolors = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.colorcolumn = "80"
o.cursorline = true
o.number = true
o.relativenumber = true
o.signcolumn = "yes"
o.scrolloff = 8
o.splitright = true
o.splitbelow = true

o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true
o.iskeyword:append('-')

o.swapfile = false
o.backup = false
o.undodir = vim.fn.stdpath("data") .. "/undodir"
o.undofile = true
o.completeopt = "menu,fuzzy,popup,nosort,noselect"

-- FIX should make completion work with <Tab>
-- o.wildmenu = true
-- o.wildmode = 'longest:full,full'

o.foldmethod = 'expr'
o.foldexpr = vim.treesitter.foldexpr()
o.foldlevel = 99

require("vim._core.ui2").enable({})

vim.api.nvim_create_autocmd("TextYankPost",
	{ callback = function() vim.highlight.on_yank() end })

vim.api.nvim_create_user_command('PackClean', function()
	for _, plugin in pairs(vim.pack.get()) do
		if not plugin['active'] then
			vim.pack.del({ plugin['spec']['name'] })
		end
	end
end, {})

vim.pack.add({
	{ src = "https://github.com/rose-pine/neovim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main"
	}, { src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" }
})

-- Plugin setups
require("rose-pine").setup({
	styles = { bold = false, italic = true, transparency = true }
})
vim.cmd.colorscheme('rose-pine')
require("which-key").setup()
require("mini.pairs").setup()
require("mini.tabline").setup()
require("mini.indentscope").setup()
require("mini.notify").setup({
	content = { format = function(notif) return notif.msg end },
	window = {
		config = {
			anchor = 'SE',
			col = vim.o.columns,
			row = vim.o.lines - 3,
			border = "none"
		}
	}
})
local fzf_lua = require("fzf-lua")
fzf_lua.setup({ winopts = { split = "belowright new" } })

require("gitsigns").setup()
require("mason").setup()

local treesitter = require("nvim-treesitter")
treesitter.install({ "lua", "python", "go", "gdscript" })

-- LSP
vim.lsp.inline_completion.enable()
vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = "󰌵"
		}
	}
})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
	end
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
vim.lsp.config("*", { capabilities = capabilities })
vim.lsp.config("lua_ls",
	{ settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
vim.lsp.enable({ "lua_ls", "pyright", "gdscript", "gopls" })

vim.lsp.config("efm", {
	init_options = { documentFormatting = true },
	settings = {
		rootMarkers = { ".git/" },
		languages = {
			lua = { { formatCommand = "lua-format -i", formatStdin = true } },
			python = {
				{ formatCommand = "black --no-color -q -", formatStdin = true }
			},
			gdscript = { { formatCommand = "gdformat -f -", formatStdin = true } }
		}
	}
})
vim.lsp.enable("efm")

-- other plugins
require("codecompanion_plugin")

-- keymaps
local kset = vim.keymap.set
kset('i', '<C- >', vim.lsp.completion.get, {})
kset({ 'n', 'v' }, "<leader>lf", vim.lsp.buf.format,
	{ desc = "Format current buffer" })
kset('n', '<tab>', ':bn<CR>', { desc = 'Next buffer' })
kset('n', '<S-tab>', ':bp<CR>', { desc = 'Prev buffer' })
kset('n', 'df', function() vim.diagnostic.open_float({ scope = "line" }) end,
	{ desc = 'Open diagnostics float' })
kset({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to clipboard' })
kset({ 'n', 'v' }, '<leader>Y', '"+Y', { desc = 'Yank line to clipboard' })
kset({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'Paste from clipboard' })
kset({ 'n', 'v' }, '<leader>P', '"+P', { desc = 'Paste line from clipboard' })
kset('n', '<leader>/', function() vim.fn.setreg('/', '') end,
	{ desc = 'Clear search keyword' })

kset('n', '<leader>fg', fzf_lua.global, { desc = "Find [G]lobally" })
kset('n', '<leader>fk', fzf_lua.keymaps, { desc = "Find [K]eymaps" })
kset('n', '<leader>fs', fzf_lua.live_grep, { desc = "Find by [S]tring grep" })

-- Random Autocommands

-- LSP format on save
vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = { '*.go', "*.lua" },
	callback = function() vim.lsp.buf.format() end
})
