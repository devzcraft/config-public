return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "<C-f>", "<cmd>NvimTreeToggle<cr>" },
		{ "<C-\\>", "<cmd>NvimTreeFindFile<cr>" },
	},
	config = function()
		require("nvim-tree").setup()

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		vim.keymap.set("n", "<leader>\\", "<cmd>NvimTreeFindFileToggle<cr>")
	end,
}
