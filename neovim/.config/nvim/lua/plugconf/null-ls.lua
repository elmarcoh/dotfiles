local builtins = require("null-ls").builtins

local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local FORMATTING = methods.internal.FORMATTING

local pycln = h.make_builtin({
    name = "pycln",
    method = FORMATTING,
    filetypes = { "python" },
    generator_opts = {
        command = "pycln",
        args = {
            "$FILENAME",
        },
        to_temp_file = true,
    },
    factory = h.formatter_factory,
})

require("null-ls").setup({
	sources = {

		-- check https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
		-- for more buitins
		builtins.formatting.stylua,

		-- python
		builtins.diagnostics.flake8,
		pycln,
		builtins.formatting.black,
		builtins.formatting.isort,
	},
	on_attach = require("lsp").on_attach,
})
