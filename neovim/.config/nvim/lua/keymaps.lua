local function setKeyMaps(maps)
	for _, map in ipairs(maps) do
		vim.cmd(map)
	end
end

setKeyMaps({
	"nmap <leader>j :cnext<cr>",
	"nmap <leader>k :cprev<cr>",
	"nnoremap Y y$",
	-- Exit to normal mode in terminal with double ESC
	"tnoremap <Esc><Esc> <C-\\><C-n>",
})

local opts = {silent=true, noremap=true}
local set_keymap = vim.api.nvim_set_keymap

set_keymap("n", "<M-j>", "<cmd>bnext<cr>", opts)
set_keymap("n", "<M-k>", "<cmd>bprev<cr>", opts)
