return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			css = { "prettierd" },
			html = { "prettierd" },
			json = { "prettierd" },
			yaml = { "prettierd" },
			gdscript = { "gdformat" },
		},
		default_format_opts = { lsp_formatt = "fallback" },
	},
	keys = {
		{
			"<leader>F",
			function()
				require("conform").format({ async = true })
			end,
			desc = "Format buffer",
		},
	},
}
