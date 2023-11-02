-- DAP debugging & stuff
return {
  "williamboman/mason.nvim",
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
      },
    },
    config = function()
      require("mason").setup()
      require("mason-nvim-dap").setup({
        ensure_installed = { "python", "delve" },
        automatic_installation = true,
        handlers = {},
      })
      local dap = require("dap")

      local dapui = require("dapui")
      dapui.setup()

      vim.keymap.set("n", "<leader>do", dapui.open, { desc = "Debugger Open" })
      vim.keymap.set("n", "<leader>dc", dapui.close, { desc = "Debugger Close" })
      vim.keymap.set("n", "<leader>dk", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    end,
  },
  "williamboman/mason-lspconfig.nvim",
  "jay-babu/mason-nvim-dap.nvim",
}
