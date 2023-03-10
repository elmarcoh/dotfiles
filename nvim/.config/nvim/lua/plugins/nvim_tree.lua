return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    filters = {
      dotfiles = true,
    },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)
    local api = require("nvim-tree.api")
    vim.keymap.set("n", "<leader>3", api.tree.toggle, { desc = "Toggle file tr[3]e" })
    vim.keymap.set("n", "<leader>f3", function()
      api.tree.find_file(vim.fn.expand("%:p"))
    end, { desc = "[F]ind current file in tr[3]e" })
  end,
}
