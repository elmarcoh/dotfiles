-- DAP debugging & stuff
return {
  "williamboman/mason.nvim",
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        keys = {
          {
            "<leader>do",
            function()
              require("dapui").open()
            end,
            desc = "Open Debugger",
          },
          {
            "<leader>dc",
            function()
              require("dapui").close()
            end,
            desc = "Open Debugger",
          },
        },
      },
    },
    config = function()
      require("mason").setup()
      require("mason-nvim-dap").setup({
        ensure_installed = { "python", "delve" },
        automatic_installation = true,
        handlers = {},
      })
      require("dapui").setup(n)
    end,
  },
  "williamboman/mason-lspconfig.nvim",
  "jay-babu/mason-nvim-dap.nvim",
}
