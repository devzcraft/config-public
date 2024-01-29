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
				"php",
				"json",
				"yaml",
				"css",
				"html",
				"lua",
				"go",
			},
			autotag = {
				enable = true,
			},
		})
	end,
}
