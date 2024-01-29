return {
	"alexghergh/nvim-tmux-navigation",
	cmd = {
		"NvimTmuxNavigateLeft",
		"NvimTmuxNavigateDown",
		"NvimTmuxNavigateUp",
		"NvimTmuxNavigateRight",
		"NvimTmuxNavigateLastActive",
	},
	keys = {
		{ "<c-h>", "<cmd>NvimTmuxNavigateLeft<cr>" },
		{ "<c-j>", "<cmd>NvimTmuxNavigateDown<cr>" },
		{ "<c-k>", "<cmd>NvimTmuxNavigateUp<cr>" },
		{ "<c-l>", "<cmd>NvimTmuxNavigateRight<cr>" },
		{ "<c-\\>", "<cmd>NvimTmuxNavigateLastActive<cr>" },
	},
	config = function()
		require("nvim-tmux-navigation").setup({})
	end,
}
