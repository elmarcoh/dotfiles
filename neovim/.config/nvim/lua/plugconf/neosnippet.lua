vim.api.nvim_set_keymap("i", "<C-k>", "<Plug>(neosnippet_expand_or_jump)", {})
vim.api.nvim_set_keymap("s", "<C-k>", "<Plug>(neosnippet_expand_or_jump)", {})
vim.api.nvim_set_keymap("x", "<C-k>", "<Plug>(neosnippet_expand_or_jump)", {})

-- vim.api.nvim_set_keymap("i", "<expr><TAB>", '<Plug>(neosnippet_expand_or_jump) ? "<Plug>(neosnippet_expand_or_jump)" : <TAB>', {})

-- vim.cmd([[
-- smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
-- ]])

