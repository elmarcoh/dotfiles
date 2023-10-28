return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      }
    },
    config = function()
      -- Enable telescope fzf native, if installed
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require("telescope").setup({
        defaults = {
          layout_strategy = "vertical",
          path_display = { truncate = 3 },
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
            },
          },
        },
      })
      pcall(require("telescope").load_extension, "fzf")

      -- See `:help telescope.builtin`
      vim.keymap.set(
        "n",
        "<leader>?",
        require("telescope.builtin").oldfiles,
        { desc = "[?] Find recently opened files" }
      )
      vim.keymap.set(
        "n",
        "<leader><space>",
        require("telescope.builtin").buffers,
        { desc = "[ ] Find existing buffers" }
      )
      vim.keymap.set("n", "<leader>/", function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end, { desc = "[/] Fuzzily search in current buffer" })

      vim.keymap.set("n", "<leader>fg", require("telescope.builtin").git_files, { desc = "[F]ind [G]it files" })
      vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[F]ind [F]iles" })
      vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "[F]ind [H]elp" })
      vim.keymap.set(
        "n",
        "<leader>fw",
        require("telescope.builtin").grep_string,
        { desc = "[F]ind current [W]ord" }
      )
      vim.keymap.set("n", "<leader>ft", require("telescope.builtin").live_grep, { desc = "[F]ind [T]ext grep" })
      vim.keymap.set(
        "n",
        "<leader>fd",
        require("telescope.builtin").diagnostics,
        { desc = "[F]ind [D]iagnostics" }
      )
      vim.keymap.set("n", "<leader>fk", require("telescope.builtin").keymaps, { desc = "[F]ind [K]eymaps" })
    end,
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
}
-- vim: ts=2 sts=2 sw=2 expandtab
