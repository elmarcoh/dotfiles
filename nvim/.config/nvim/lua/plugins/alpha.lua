return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("alpha").setup(require("alpha.themes.startify").config)
    vim.keymap.set("n", "<leader>al", ":Alpha<cr>", { desc = "Open Alpha start page" })
  end,
}
