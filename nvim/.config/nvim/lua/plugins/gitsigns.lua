return {
  -- Adds git releated signs to the gutter, as well as utilities for managing changes
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    current_line_blame = true,
  },

  keys = {
    { "<leader>gh", "<cmd>Gitsigns preview_hunk<cr>",              desc = "[G]itsigns [H]unk" },
    { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "[G]itsigns [B]lame toggle" },
  },
}
