return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ravitemer/codecompanion-history.nvim",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			ft = { "codecompanion" },
			-- ft = { "markdown", "codecompanion" },
		},
		{
			"echasnovski/mini.diff",
			config = function()
				local diff = require("mini.diff")
				diff.setup({
					-- Disabled by default
					source = diff.gen_source.none(),
				})
			end,
		},
	},
	opts = {
		extensions = { history = { enabled = true } },
		display = {
			chat = {
				show_settings = false,
			},
		},
		strategies = {
			chat = { adapter = "openrouter" },
			inline = { adapter = "openrouter" },
		},

		adapters = {
			http = {
				openrouter = function()
					return require("codecompanion.adapters").extend("openrouter", {
						schema = { preset = { default = "qwen/qwen3-coder:free" } },
					})
				end,
			},
		},
	},
	keys = {
		{
			"<Leader>cc",
			"<cmd>CodeCompanionChat Toggle<cr>",
			mode = "n",
			desc = "[C]odeCompanion [C]hat"
		},
		{
			"<Leader>ch",
			function()
				require("codecompanion").toggle_chat({
					window_opts = {
						layout = "horizontal",
						position = "below",
						height = 0.3,
					},
				})
			end,
			mode = "n",
			desc = "[C]odeCompanion chat [H]orizontal",
		},
		{
			"<Leader>cv",
			function()
				require("codecompanion").toggle_chat({
					window_opts = {
						layout = "vertical",
						position = "right",
						full_height = true,
					},
				})
			end,
			mode = "n",
			desc = "[C]odeCompanion chat [V]ertical",
		},
		{
			"<Leader>ca",
			"<cmd>CodeCompanionActions<cr>",
			mode = { "n", "v" },
			desc = "[C]odeCompanion [A]ctions",
		},
	},
}
