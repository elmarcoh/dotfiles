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

local function setup_servers()
    require'lspinstall'.setup()


    local servers = require'lspinstall'.installed_servers()
    local lspconfig = require'lspconfig'

    -- Tries to load configs from 'lsp/<lang>.lua', or use our default on_attach otherwise
    for _, server in pairs(servers) do
      local ok, _ = pcall(require, 'lsp.' .. server)
      if not ok then
        lspconfig[server].setup{on_attach = require('lsp').on_attach}
      end
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
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
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, {text=icon, texthl=hl, numhl=""})
end
