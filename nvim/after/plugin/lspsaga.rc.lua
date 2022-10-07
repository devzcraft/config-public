local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.init_lsp_saga()

local opts = { noremap = true, silent = true }
-- vim.keymap.set("n", "<c-j>", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
-- vim.keymap.set("n", "k", "<cmd>lspsaga hover_doc<cr>", opts)
-- vim.keymap.set("n", "gd", "<cmd>Lspsaga lsp_finder<cr>", opts)
-- vim.keymap.set("i", "<c-k>", "<cmd>Lspsaga signature_help<cr>", opts)
-- vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<cr>", opts)
-- vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<cr>", opts)
-- vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", { silent = true })
