return {
	"ray-x/go.nvim",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		-- "theHamsta/nvim-dap-virtual-text",
		"neovim/nvim-lspconfig",
		{ "ray-x/guihua.lua", build = "cd lua/fzy && make" },
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	},
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()',

	config = function()
		require("go").setup({
			lsp_cfg = false,
			goimports = "gopls", -- if set to 'gopls' will use gopls format, also goimport
			fillstruct = "gopls",
			verbose = false,
			lsp_inlay_hints = {
				enable = false,
			},
			luasnip = true,
			dap_debug = true,
			-- null_ls = {           -- set to false to disable null-ls setup
			--     golangci_lint = {
			--       -- method = {"NULL_LS_DIAGNOSTICS_ON_SAVE", "NULL_LS_DIAGNOSTICS_ON_OPEN"}, -- when it should run
			--       -- disable = {'errcheck', 'staticcheck'}, -- linters to disable empty by default
			--       -- enable = {'govet', 'ineffassign','revive', 'gosimple'}, -- linters to enable; empty by default
			--       severity = vim.diagnostic.severity.INFO, -- severity level of the diagnostics
			--     },
			-- },
		})

		vim.keymap.set("n", "<leader>db", "<cmd>GoDebug -b<cr>")
		vim.keymap.set("n", "<leader>ds", "<cmd>GoDebug<cr>")
		vim.keymap.set("n", "<leader>dx", "<cmd>GoDebug -s<cr>")

		vim.g.null_ls_disable = true

		local cfg = require("go.lsp").config() -- config() return the go.nvim gopls setup

		require("lspconfig").gopls.setup(cfg)

		local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				require("go.format").goimports()
			end,
			group = format_sync_grp,
		})
	end,
}
