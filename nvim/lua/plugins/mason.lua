return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"golangci_lint_ls",
				"tailwindcss",
				"intelephense",
				"gopls",
			},
		})
		require("mason-nvim-dap").setup({
			ensure_installed = { "delve" },
		})
	end,
}
