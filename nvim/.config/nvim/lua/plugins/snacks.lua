return {
  "folke/snacks.nvim",
  opts = {
    explorer = {},
    picker = {
      sources = {explorer = {}},
      layout = {preset = "bottom"},
    }
  },
  keys = {
    {"<leader>3", function() Snacks.explorer() end, desc="Open File Explorer"},
    {"<leader>  ", function () Snacks.picker.buffers() end, desc="Find Buffers"},
    {"<leader>ff", function () Snacks.picker.files() end, desc="Find Files"},
    {"<leader>fg", function () Snacks.picker.git_files() end, desc="Find Git Files"},
    {"<leader>fr", function () Snacks.picker.recent() end, desc="Find Recent Files"},
    -- LSP
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>st", function() Snacks.picker.grep() end, desc = "Text" },
  }
}
