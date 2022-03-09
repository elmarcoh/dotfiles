local mod = {}

function mod.config()
	require("nvim-tree").setup({})
	local opts = {noremap=true, silent=true}
	vim.api.nvim_set_keymap("n", "<leader>3f", "<cmd>NvimTreeFindFile<cr>", opts)
	vim.api.nvim_set_keymap("n", "<leader>33", "<cmd>NvimTreeToggle<cr>", opts)
end

return mod
