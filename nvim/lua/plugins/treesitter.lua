return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
				disable = {},
			},
			indent = {
				enable = true,
				disable = {},
			},
			ensure_installed = {
				"toml",
				"markdown",
				"json",
				"yaml",
				"css",
				"html",
				"lua",
				"go",
				"gowork",
				"sql",
				"markdown_inline",
			},
			autotag = {
				enable = true,
			},
		})
	end,
}
