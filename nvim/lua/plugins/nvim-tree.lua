return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "<C-f>", "<CMD>NvimTreeToggle<CR>" },
		{ "<C-\\>", "<CMD>NvimTreeFindFile<CR>" },
	},
	config = function()
		require("nvim-tree").setup()

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
}
