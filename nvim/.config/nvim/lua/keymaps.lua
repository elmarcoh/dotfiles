vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- open netrw file explorer
vim.keymap.set("n", "<leader>3", ":25Lex<cr>", { desc = "File explorer" })

-- always keep curson on the center of screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- fast delete buffer, write, etc
vim.keymap.set("n", ";d", ":bd<cr>", { silent = true })
vim.keymap.set("n", ";w", ":w<cr>", { silent = true })

-- Remap for clipboard copy/paste
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Clipboard Yank" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Clipboard Paste" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Clipboard Line Yank" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Clipboard Line Paste" })

-- Buffer navigation
vim.keymap.set("n", "<Tab>", ":bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<cr>", { desc = "Previous buffer" })

-- Pane navigation
vim.keymap.set("n", "s", "<Nop>", { desc = "Splits" }) -- disable default binding for `s`
vim.keymap.set("n", "ss", "<C-w><C-w>", { desc = "Cycle splits" })
vim.keymap.set("n", "sh", "<C-w>h", { desc = "Left split" })
vim.keymap.set("n", "sj", "<C-w>j", { desc = "Down split" })
vim.keymap.set("n", "sk", "<C-w>k", { desc = "Up split" })
vim.keymap.set("n", "sl", "<C-w>l", { desc = "Right split" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })

vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
