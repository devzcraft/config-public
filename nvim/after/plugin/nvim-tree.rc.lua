local status, tree = pcall(require, "nvim-tree")

if not status then
	return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

tree.setup()

vim.keymap.set("n", "<C-f>", "<CMD>NvimTreeToggle<CR>")
vim.keymap.set("n", "<C-\\>", "<CMD>NvimTreeFindFile<CR>")
