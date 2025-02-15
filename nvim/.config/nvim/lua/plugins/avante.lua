return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    -- !! make sure to run `:Copilot auth`
    provider = "copilot",
    -- This setting WILL ban you from Copilot due to token renewal SPAM
    -- auto_suggestions_provider = "copilot",
    file_selector = {
      provider = "telescope",
    },
    windows = {
      width = 35,
    },
  },
  -- opts = {
  --   provider = "ollama",
  --   behaviour = {
  --     auto_suggestions = false,
  --     auto_set_highlight_group = false,
  --     auto_set_keymaps = true,
  --     auto_apply_diff_after_generation = false,
  --     support_paste_from_clipboard = false,
  --   },
  --   hint = { enable = false },
  --   vendors = {
  --     ollama = {
  --       __inherited_from = "openai",
  --       api_key_name = "",
  --       endpoint = "http://127.0.0.1:11434/v1",
  --       model = "mistral",
  --     },
  --   },
  -- },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "hrsh7th/nvim-cmp",                                   -- autocompletion for avante commands and mentions
    "nvim-telescope/telescope.nvim",                      -- for file_selector provider telescope
    { "zbirenbaum/copilot.lua", lazy = false, opts = {} }, -- for providers='copilot'
    --- The below dependencies are optional,
  },
}
