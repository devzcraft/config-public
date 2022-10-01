vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5
vim.opt.background = "dark"

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.tmpl", command = "setfiletype go" })
