return {
	"olimorris/codecompanion.nvim",
	opts = {
		extensions = { history = { enabled = true } },
		display = {
			chat = {
				show_settings = false,
			},
		},
		strategies = {
			chat = {
				adapter = "anthropic",
			},
		},

		adapters = {
			anthropic = function()
				return require("codecompanion.adapters").extend("anthropic", {
					env = {
						api_key = "ANTHROPIC_API_KEY",
					},
				})
			end,
			openrouter = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					env = {
						url = "https://openrouter.ai/api",
						api_key = "OPENROUTER_API_KEY",
						chat_url = "/v1/chat/completions",
					},
					schema = {
						model = {
							default = "qwen/qwen3-235b-a22b:free",
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
