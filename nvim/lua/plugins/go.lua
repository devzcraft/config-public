return {
	"ray-x/go.nvim",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap",
		"theHamsta/nvim-dap-virtual-text",
		{ "ray-x/guihua.lua", build = "cd lua/fzy && make" },
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	},
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()',
	config = function()
		require("go").setup({
			lsp_cfg = false,
			goimport = "gopls", -- if set to 'gopls' will use gopls format, also goimport
			fillstruct = "gopls",
			verbose = true,
			lsp_inlay_hints = {
				enable = true,
			},
			luasnip = true,
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
				require("go.format").goimport()
			end,
			group = format_sync_grp,
		})
	end,
}
