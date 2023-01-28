local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.setup({
	code_action = {
		keys = {
			quit = "<C-c>",
			exec = "<CR>",
		},
	},
	lightbulb = {
		enable = true,
		enable_in_insert = true,
		sign = false,
		sign_priority = 40,
		virtual_text = false,
	},
	finder = {
		open = { "o", "<CR>" },
		vsplit = "s",
		split = "i",
		tabe = "t",
		quit = { "<C-c>" },
	},
})

local keymap = vim.keymap.set

keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

keymap("n", "<C-b>", "<CMD>Lspsaga lsp_finder<CR>", { silent = true })
keymap("n", "<M-3>", "<CMD>Lspsaga rename<CR>")
keymap({ "n", "v" }, "<M-CR>", "<cmd>Lspsaga code_action<CR>", { silent = true })
