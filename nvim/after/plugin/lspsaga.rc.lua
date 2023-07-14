local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.setup({
	rename = {
		in_select = false,
		auto_save = true,
		keys = {
			quit = "<C-c>",
		},
	},
	finder = {
		max_height = 1,
		layout = "normal",
		keys = {
			quit = "<C-c>",
		},
	},
})

local keymap = vim.keymap.set

keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

keymap("n", "<C-b>", "<CMD>Lspsaga finder def+ref<CR>", { silent = true })
keymap("n", "<C-e>", "<CMD>Lspsaga rename<CR>")
keymap({ "n", "v" }, "<M-CR>", "<cmd>Lspsaga code_action<CR>", { silent = true })
