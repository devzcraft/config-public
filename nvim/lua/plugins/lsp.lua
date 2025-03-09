return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"folke/lsp-colors.nvim",
		"neovim/nvim-lspconfig", -- LSP
	},
	config = function()
		require("lsp-colors").setup({
			Error = "#db4b4b",
			Warning = "#e0af68",
			Information = "#0db9d7",
			Hint = "#10B981",
		})

		local on_attach = function(client, bufnr)
			local bufopts = { noremap = true, silent = true }

			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
			-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
		end

		-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		-- LUA langauge server

		nvim_lsp = require("lspconfig")

		-- GoLang language server
		nvim_lsp.golangci_lint_ls.setup({
			filetypes = { "work", "go", "gomod", "gowork", "gotmpl" },
		})

		-- nvim_lsp.gopls.setup({
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- 	filetypes = { "go", "gomod", "gowork", "gotmpl" },
		-- 	settings = {
		-- 		gopls = {
		-- 			completeUnimported = true,
		-- 			usePlaceholders = true,
		-- 			analyses = {
		-- 				unusedparams = true,
		-- 			},
		-- 		},
		-- 	},
		-- })

		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			underline = true,
			update_in_insert = false,
			virtual_text = { spacing = 4, prefix = "" },
			severity_sort = true,
		})

		-- Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		require("lspsaga").setup({
			ui = {
				kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
			},
			lightbulb = {
				enable = false,
			},
			rename = {
				in_select = false,
				auto_save = true,
				keys = {
					quit = "<C-c>",
				},
			},
			finder = {
				max_height = 1,
				layout = "normal",
				keys = {
					quit = "<C-c>",
				},
			},
		})

		local keymap = vim.keymap.set

		keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
		keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

		keymap("n", "<C-b>", "<CMD>Lspsaga finder def+ref<CR>", { silent = true })
		keymap("n", "<C-e>", "<CMD>Lspsaga rename<CR>")
		keymap({ "n", "v" }, "<M-CR>", "<cmd>Lspsaga code_action<CR>", { silent = true })
		keymap({ "n", "v" }, "<C-t>", "<cmd>Lspsaga term_toggle<CR>", { silent = true })
		keymap({ "n", "v" }, "<leader>l", "<cmd>Lspsaga show_workspace_diagnostics ++float<CR>", { silent = true })
		keymap({ "n", "i" }, "<C-a>", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
		keymap({ "n", "i", "v" }, "<C-t>", "<cmd>Lspsaga term_toggle<CR>", { silent = true })
	end,
}
