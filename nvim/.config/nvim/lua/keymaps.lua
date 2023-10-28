vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- open netrw file explorer
vim.keymap.set("n", "<leader>3", ":25Lex<cr>", {desc="File explorer"})

-- always keep curson on the center of screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", ";d", ":bd<cr>", { silent = true })
vim.keymap.set("n", ";w", ":w<cr>", { silent = true })

-- Remap for clipboard copy/paste
vim.keymap.set("v", "<leader>y", '"+y', {desc="Clipboard Yank"})
vim.keymap.set("n", "<leader>y", '"+y', {desc="Clipboard Yank"})
vim.keymap.set("n", "<leader>Y", '"+Y', {desc="Clipboard Yank"})
vim.keymap.set("v", "<leader>p", '"+p', {desc="Clipboard Paste"})
vim.keymap.set("n", "<leader>p", '"+p', {desc="Clipboard Paste"})
vim.keymap.set("n", "<leader>P", '"+P', {desc="Clipboard Paste"})

-- Buffer navigation
vim.keymap.set("n", "<Tab>", ":bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<cr>", { desc = "Previous buffer" })

vim.keymap.set("n", "<leader>w", ":w<cr>", { desc = "[W]rite file" })

vim.keymap.set("n", "<leader>n", ":Neogit<cr>", { desc = "Open Neogit" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })

require("which-key").register({["<leader>d"] = {"", "+Diagnostics"}})
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
