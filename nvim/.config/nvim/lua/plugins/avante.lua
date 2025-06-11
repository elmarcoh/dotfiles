return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    -- !! make sure to run `:Copilot auth`
    provider = "claude",
    -- This setting WILL ban you from Copilot due to token renewal SPAM
    auto_suggestions_provider = "claude",
    file_selector = {
      provider = "telescope",
    },
    windows = {
      width = 35,
    },

    -- Claude configuration
    providers = {
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-sonnet-4-20250514", -- or "claude-3-5-sonnet-20241022"
        extra_request_body = {
          temperature = 0,
          max_tokens = 2048,
        },
        api_key_name = "ANTHROPIC_API_KEY",
      },
    },

    -- You can also configure dual mode or switch between providers
    behaviour = {
      auto_suggestions = false, -- Enable auto suggestions
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
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
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "zbirenbaum/copilot.lua",        -- for providers='copilot'
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },  },
}
