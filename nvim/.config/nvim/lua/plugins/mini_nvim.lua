return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.pairs").setup({})
		require("mini.comment").setup({})
		require("mini.tabline").setup({})

		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

				-- Highlight hex color strings (`#rrggbb`) using that color
				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})

		-- from https://youtu.be/nB2EIjKtJ8U?si=ZFcoBBtwaielMpuS&t=645
		require "mini.notify".setup({
			content = {
				format = function(notif)
					return notif.msg
				end,
			},
			window = {
				config = function()
					return {
						title = "",
						anchor = "SE",
						row = vim.o.lines - 2,
						col = vim.o.columns,
						border = "none",
					}
				end,
			}
		})
	end,
}
