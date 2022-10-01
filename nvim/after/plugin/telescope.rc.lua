local status, telescope = pcall(require, "telescope")
if not status then
	return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local fb_actions = require("telescope").extensions.file_browser.actions

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

telescope.setup({
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

telescope.load_extension("file_browser")

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
	})
end)
vim.keymap.set("n", ",,", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "normal",
		layout_config = { height = 40 },
	})
end)
