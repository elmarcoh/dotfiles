local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		mappings = {
			n = {
				["Q"] = actions.send_to_qflist,
			},
		},
	},
})

local function setKeyMaps(maps)
	for _, map in ipairs(maps) do
		vim.cmd(map)
	end
end

setKeyMaps({
	-- " Find files using Telescope command-line sugar.
	"nnoremap <leader>ff <cmd>Telescope find_files<cr>",
	"nnoremap <leader>fg <cmd>Telescope live_grep<cr>",
	"nnoremap <leader>fb <cmd>Telescope buffers<cr>",
	"nnoremap <leader>fh <cmd>Telescope help_tags<cr>",
	"nnoremap <leader>fl <cmd>Telescope git_files<cr>",
	"nnoremap <leader>fk <cmd>Telescope keymaps<cr>",
})
