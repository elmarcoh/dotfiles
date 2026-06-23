-- LSP settings.lsp
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client_id, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	vim.lsp.completion.enable(true, client_id, bufnr, { autotrigger = true })
	vim.keymap.set("i", "<C-Space>", function()
		vim.lsp.completion.get()
	end, { buffer = bufnr, desc = "LSP Complete" })

	nmap("<leader>lr", vim.lsp.buf.rename, "[R]ename")
	nmap("<leader>la", vim.lsp.buf.code_action, "code [A]ction")

	nmap("gd", vim.lsp.buf.definition, "Go to [D]efinition")
	nmap("gI", vim.lsp.buf.implementation, "Go to [I]mplementation")

	nmap("<leader>lD", vim.lsp.buf.type_definition, "Type [D]efinition")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	vim.keymap.set(
		{ "n", "i" },
		"<C-k>",
		vim.lsp.buf.signature_help,
		{ buffer = bufnr, desc = "Signature Documentation" }
	)

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("<leader>lwa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>lwr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>lwl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		require("conform").format({ async = true })
		-- vim.lsp.buf.format()
	end, { desc = "Format current buffer" })

	nmap("<leader>lf", vim.lsp.buf.format, "[F]ormat current file")

	require("which-key").add({
		{ "<leader>l", group = "+LSP" },
		{ "<leader>lw", group = "+Workspace" },
	})
end

-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here.
-- They will automatically be installed.
-- Add any additional override configuration in the following table.
-- It will be passed to the `settings` field of the server config.
local servers = {
	pyright = {},
	ts_ls = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
	-- Until I have to deal with ruby again
	-- solargraph = {},
}

-- Setup mason so it can manage external tooling
require("mason").setup()

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup({
	function(server_name)
		local settings = {
			capabilities = capabilities,
			-- on_attach = on_attach,
			settings = servers[server_name],
		}
		-- Until I have to deal with ruby again
		-- if server_name == "solargraph" then
		--   settings["cmd"] = { "bundle", "exec", "solargraph", "stdio" }
		-- end
		require("lspconfig")[server_name].setup(settings)
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	-- pattern = "*.gd",
	callback = function(args)
		on_attach(args.data.client_id, args.buf)
		-- vim.lsp.completion.enable(true, args.data.client_id, args.buf, { autotrigger = true })
		-- vim.keymap.set({ "i" }, "<C-Space>", function()
		-- 	vim.lsp.completion.get()
		-- end, { buffer = args.buf })
	end,
})

-- vim: ts=2 sts=2 sw=2 et
