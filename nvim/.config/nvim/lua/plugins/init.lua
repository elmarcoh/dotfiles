return {
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	-- LSP Configuration & Plugins
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "j-hui/fidget.nvim", opts = {}, tag = "legacy" },

			-- Additional lua configuration, makes nvim stuff amazing!
			"folke/neodev.nvim",

			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	},

	-- Useful plugin to show you keybinds.
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").add({
				{ "<leader>f", group = "Fuzzy Find" },
				{ "<leader>d", group = "Debug/Diagnostics" },
				{ "<leader>g", group = "[Git]signs" },
			})
		end,
	},
	{
		-- Adds git releated signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			current_line_blame = true,
		},

		keys = {
			{ "<leader>gg", "<cmd>Gitsigns preview_hunk<cr>", desc = "Get Hunk" },
			{ "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk" },
			{ "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Hunk" },
			{ "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous Hunk" },
			{ "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Blame toggle" },
		},
	},
	-- colorschemes
	-- {
	--   "folke/tokyonight.nvim",
	--   priority = 1000,
	--   config = function()
	--     vim.cmd.colorscheme("tokyonight-night")
	--   end,
	-- },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		-- See `:help lualine.txt`
		opts = {
			options = {
				icons_enabled = false,
				theme = "catppuccin",
				component_separators = "|",
				section_separators = "",
			},
		},
	},

	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	-- dreaded copilot 💀
	-- { "github/copilot.vim" },
}
-- vim: ts=2 sts=2 sw=2 expandtab
