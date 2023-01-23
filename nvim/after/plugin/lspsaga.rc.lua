local status, saga = pcall(require, "lspsaga")
if not status then
    return
end

saga.init_lsp_saga({
    code_action_icon = "",
    code_action_keys = {
        quit = "<C-c>",
        exec = "<CR>",
    },
    definition_action_keys = {
        quit = "<C-c>",
    },
    rename_action_quit = "<C-c>",
    finder_action_keys = {
        open = { "o", "<CR>" },
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = { "<C-c>" },
    },
})

local keymap = vim.keymap.set

keymap("n", "<C-b>", "<CMD>Lspsaga lsp_finder<CR>", { silent = true })
keymap("n", "<M-3>", "<CMD>Lspsaga rename<CR>")
keymap({ "n", "v" }, "<M-CR>", "<cmd>Lspsaga code_action<CR>", { silent = true })
