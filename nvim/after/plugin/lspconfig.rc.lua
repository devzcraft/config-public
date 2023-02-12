local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local on_attach = function(client, bufnr)
	-- local bufopts = { noremap = true, silent = true, buffer = bufnr }
	local bufopts = { noremap = true, silent = true }

	-- if client.name == "sumneko_lua" or client.name == "intelephense" or client.name == "gopls" then
	-- if client.name == "gopls" then
	-- 	client.server_capabilities.documentFormattingProvider = false
	-- end

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<leader>l", vim.diagnostic.open_float, bufopts)

	-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	-- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	-- vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	-- vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
end

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- LUA langauge server
nvim_lsp.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},

			workspace = {
				preloadFileSize = 1024,
				checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

nvim_lsp.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- PHP language server
nvim_lsp.intelephense.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- GoLang language server
nvim_lsp.golangci_lint_ls.setup({
	filetypes = { "go", "gomod" },
})

nvim_lsp.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
