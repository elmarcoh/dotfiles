return {
	"Mathijs-Bakker/godotdev.nvim",
	dependencies = { "nvim-lspconfig", "nvim-dap", "nvim-dap-ui" },
	opts = {
		editor_host = "127.0.0.1", -- Godot editor host
		editor_port = 6005, -- LSP port
		debug_port = 6006, -- DAP port
		-- csharp      = true,        -- enable C# support
		-- autostart_editor_server = true, -- optional, start server automatically
	},
}
