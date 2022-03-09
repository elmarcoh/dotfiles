local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

-- Auto compile when there are changes in plugins.lua
vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- color schemes
	-- use {'sonph/onehalf', rtp="vim", opt=true, as="onehalf"}
	-- use 'tomasr/molokai'
	-- use 'Th3Whit3Wolf/one-nvim'
	-- use 'drewtempelmeyer/palenight.vim'
	use("folke/tokyonight.nvim")
	use("EdenEast/nightfox.nvim")

	use("jiangmiao/auto-pairs")
	use("sheerun/vim-polyglot")

	use({
		"neovim/nvim-lspconfig",
		"williamboman/nvim-lsp-installer",
	})

	-- report lint errors as LSP thingies (i.e flake8)
	use("jose-elias-alvarez/null-ls.nvim")
	require("plugconf.null-ls")

	use("nvim-lua/completion-nvim")

	use({
		"hoob3rt/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			-- {'nvim-lua/lsp-status.nvim', opt = true},
		},
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = require'plugconf.nvim-tree'.config
	})

	-- This makes diagnostics to lose color and underlines :'(
	-- use 'nvim-lua/lsp-status.nvim'
	require("plugconf.lualine")

	use("tpope/vim-fugitive")

	-- All this for telescope
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")

	use("tpope/vim-surround")

	use("b3nj5m1n/kommentary")
	require("plugconf.kommentary")

	use("mhinz/vim-startify")
	require("plugconf.startify")

	-- plugin configs
	require("plugconf.telescope")

	use("metakirby5/codi.vim")
	use({ "tyru/open-browser-github.vim", requires = { "tyru/open-browser.vim" } })

	-- snippets !
	use({
		"fhill2/telescope-ultisnips.nvim",
		requires = {
			"SirVer/ultisnips",
			"honza/vim-snippets",
		},
	})
	require("plugconf.ultisnips")

	use({
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"onsails/lspkind-nvim",
		"hrsh7th/nvim-cmp",
		"quangnguyen30192/cmp-nvim-ultisnips",
	})
	require("plugconf.nvim-cmp")
end)
