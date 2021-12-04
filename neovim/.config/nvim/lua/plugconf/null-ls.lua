require("null-ls").config({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.completion.spell,
        require("null-ls").builtins.diagnostics.flake8,
    },
})
require("lspconfig")["null-ls"].setup({
    on_attach = require'lsp'.on_attach,
})
