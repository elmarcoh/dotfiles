require("lualine").setup({
	options = {
		theme = "palenight",
		section_separators = "",
		component_separators = "",
	},

	sections = {
		lualine_b = { "branch", "diff" },
		lualine_c = {
			{ "filename" },
			-- this comes from the lualine docs
			{
				"diagnostics",
				-- table of diagnostic sources, available sources:
				-- nvim_lsp, coc, ale, vim_lsp
				sources = { "nvim_diagnostic" },
				-- displays diagnostics from defined severity
				sections = { "error", "warn", "info", "hint" },
				-- all colors are in format #rrggbb
				--[[ color_error = nil, -- changes diagnostic's error foreground color
        color_warn = nil, -- changes diagnostic's warn foreground color
        color_info = nil, -- Changes diagnostic's info foreground color
        color_hint = nil, -- Changes diagnostic's hint foreground color ]]
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
		},
	},
})
