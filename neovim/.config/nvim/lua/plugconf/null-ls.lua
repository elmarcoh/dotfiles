local builtins = require("null-ls").builtins

require("null-ls").setup({
	sources = {

		-- check https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
		-- for more buitins
		builtins.formatting.stylua,

		-- python
		builtins.diagnostics.flake8,
		builtins.formatting.black,
		builtins.formatting.isort,
	},
	on_attach = require("lsp").on_attach,
})
