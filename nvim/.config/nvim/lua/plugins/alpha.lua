return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local startify = require("alpha.themes.startify")
		-- startify.nvim_web_devicons.enabled = false
		require("alpha").setup(startify.config)
		vim.keymap.set("n", "<leader>A", ":Alpha<cr>", { desc = "Open Alpha start page" })
	end,
}
