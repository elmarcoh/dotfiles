return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
          -- ensure_installed = { "python", "delve" },
          automatic_installation = true,
          handlers = {},
        }
      }
    },
  },
}
