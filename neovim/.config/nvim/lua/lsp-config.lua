-- diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    underline = true,
    update_in_insert = true,
    virtual_text = false,
})

-- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnum, ...) end


buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
local lsp_installer = require'nvim-lsp-installer'
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp_installer.on_server_ready(function(server)
    -- Tries to load configs from 'lsp/<lang>.lua', or use our default on_attach otherwise
    local ok, _ = pcall(require, 'lsp.' .. server.name)
    if not ok then
        server:setup{on_attach = require('lsp').on_attach, capabilities = capabilities}
    end
end)

-- Install stuff that I always use
local my_servers = {
    "sumneko_lua",
    "pyright",
    "omnisharp",
}
local servers = require'nvim-lsp-installer.servers'

for _, server_name in pairs(my_servers) do
    local available, server = servers.get_server(server_name)
    if available and not server:is_installed() then
        server:install()
    end
end

-- Pretty icons 🎨
vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ",
    "   (Method)",
    "   (Function)",
    "   (Constructor)",
    " ﴲ  (Field)",
    "[] (Variable)",
    "   (Class)",
    " ﰮ  (Interface)",
    "   (Module)",
    " 襁 (Property)",
    "   (Unit)",
    "   (Value)",
    " 練 (Enum)",
    "   (Keyword)",
    "   (Snippet)",
    "   (Color)",
    "   (File)",
    "   (Reference)",
    "   (Folder)",
    "   (EnumMember)",
    " ﲀ  (Constant)",
    " ﳤ  (Struct)",
    "   (Event)",
    "   (Operator)",
    "   (TypeParameter)"
}

-- gutter (side column) icons
local signs = {Error=" ", Warning=" ", Hint=" ", Information=" "}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {text=icon, texthl=hl, numhl=""})
end
