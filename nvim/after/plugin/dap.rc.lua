local status, dap = pcall(require, "dap")
if not status then
    return
end

vim.fn.sign_define("DapBreakpoint", {
    text = "",
    texthl = "LspDiagnosticsErrorLineNr",
    linehl = "LspDiagnosticsError",
    numhl = "LspDiagnosticsError",
})
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", {
    text = "",
    texthl = "LspDiagnosticsInfoLineNr",
    linehl = "LspDiagnosticsInfo",
    numhl = "LspDiagnosticsInfo",
})

vim.keymap.set("n", "<leader>dn", [[<Cmd>lua require'dap'.continue()<CR>]])
vim.keymap.set("n", "<leader>db", [[<Cmd>lua require'dap'.toggle_breakpoint()<CR>]])
vim.keymap.set("n", "<leader>ds", [[<Cmd>lua require'dap'.close()<CR>]])
vim.keymap.set("n", "<S-k>", [[<Cmd>lua require'dap'.step_out()<CR>]])
vim.keymap.set("n", "<S-l>", [[<Cmd>lua require'dap'.step_into()<CR>]])
-- TODO: find better shortcut
-- vim.keymap.set("n", "<S-j>", [[<Cmd>lua require'dap'.step_over()<CR>]])
vim.keymap.set("n", "<leader>dR", function()
    require("dap").clear_breakpoints()
end)
