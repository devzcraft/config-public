return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				layout_config = {
					horizontal = {
						height = 0.99,
						preview_cutoff = 0,
						prompt_position = "bottom",
						width = 0.9,
					},
					center = {
						width = 0.5,
						height = 0.4,
						preview_cutoff = 40,
						prompt_position = "top",
					},
				},
				mappings = {
					n = {
						["<C-c>"] = actions.close,
					},
				},
				file_ignore_patterns = { "node_modules", "vendor" },
			},
			extensions = {
				file_browser = {
					theme = "dropdown",
					hijack_netrw = true,
					["n"] = {
						["/"] = function()
							vim.cmd("startinsert")
						end,
					},
				},
			},
			pickers = {
				find_files = {},
			},
		})

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>f", function()
			builtin.find_files({
				no_ignore = false,
				hidden = false,
				initial_mode = "normal",
			})
		end)
		vim.keymap.set("n", "<leader>r", function()
			builtin.live_grep()
		end)
		vim.keymap.set("n", "<leader>b", function()
			builtin.buffers({
				initial_mode = "normal",
				sort_lastused = true,
			})
		end)
	end,
}
