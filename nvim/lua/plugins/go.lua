return {
	"ray-x/go.nvim",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap",
		"theHamsta/nvim-dap-virtual-text",
		{ "ray-x/guihua.lua", build = "cd lua/fzy && make" },
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	},
	config = function()
		require("go").setup({
			goimport = "gopls", -- if set to 'gopls' will use gopls format, also goimport
			fillstruct = "gopls",
			verbose = true,
			lsp_inlay_hints = {
				enable = true,
			},
			luasnip = true,
		})

		vim.g.null_ls_disable = true

		local cfg = require("go.lsp").config() -- config() return the go.nvim gopls setup

		require("lspconfig").gopls.setup(cfg)
	end,
}
