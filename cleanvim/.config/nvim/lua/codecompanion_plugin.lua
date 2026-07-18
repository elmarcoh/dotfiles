vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/ravitemer/codecompanion-history.nvim" },
	{ src = "https://github.com/olimorris/codecompanion.nvim" },
	{ src = "https://github.com/echasnovski/mini.diff" }
})

require("mini.diff").setup({
	-- Disabled by default
	source = require("mini.diff").gen_source.none()
})

require("codecompanion").setup({
	extensions = { history = { enabled = true } },
	display = { chat = { show_settings = false } },
	strategies = {
		chat = { adapter = "openrouter" },
		inline = { adapter = "openrouter" }
	},

	adapters = {
		http = {
			openrouter = function()
				return require("codecompanion.adapters").extend("openrouter", {
					schema = { preset = { default = "qwen/qwen3-coder:free" } }
				})
			end
		}
	}
})

vim.keymap.set('n', '<leader>cv', function()
	require("codecompanion").toggle_chat({
		window_opts = {
			layout = "vertical",
			position = "right",
			full_height = true
		}
	})
end, { desc = "[C]odeCompanion chat [V]ertical" })

vim.keymap.set('n', '<leader>ch', function()
	require("codecompanion").toggle_chat({
		window_opts = { layout = "horizontal", position = "below", height = 0.3 }
	})
end, { desc = "[C]odeCompanion chat [H]orizontal" })
