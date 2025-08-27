return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"ravitemer/codecompanion-history.nvim",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			ft = { "markdown", "codecompanion" },
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
			openrouter = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					env = {
						url = "https://openrouter.ai/api",
						api_key = "OPENROUTER_API_KEY",
						chat_url = "/v1/chat/completions",
					},
					schema = {
						model = {
							default = "qwen/qwen3-coder:free",
						},
					},
				})
			end,
		},
	},
	keys = {
		{ "<Leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", mode = "n", desc = "Toggle [C]odeCompanion [C]hat" },
		{ "<Leader>cc", "<cmd>CodeCompanion<cr>", mode = "v", desc = "Toggle [C]odeCompanion [C]hat (inline)" },
		{
			"<Leader>ca",
			"<cmd>CodeCompanionActions<cr>",
			mode = { "n", "v" },
			desc = "Toggle [C]odeCompanion [A]ctions",
		},
	},
}
