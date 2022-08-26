local status, dap = pcall(require, "dap")
if not status then
	return
end

dap.adapters.go = function(callback, config)
	local handle
	local pid_or_err
	local port = 38697
	handle, pid_or_err = vim.loop.spawn("dlv", {
		args = { "dap", "-l", "127.0.0.1:" .. port },
		detached = true,
	}, function(code)
		handle:close()
		print("Delve exited with exit code: " .. code)
	end)
	dap.repl.open()
	callback({ type = "server", host = "127.0.0.1", port = port })
end

dap.configurations.go = {
	{
		type = "go",
		name = "Debug",
		request = "launch",
		program = "${file}",
	},
}

local dap_breakpoint = {
	error = {
		text = "🟥",
		texthl = "LspDiagnosticsSignError",
		linehl = "",
		numhl = "",
	},
	rejected = {
		text = "",
		texthl = "LspDiagnosticsSignHint",
		linehl = "",
		numhl = "",
	},
	stopped = {
		text = "⭐️",
		texthl = "LspDiagnosticsSignInformation",
		linehl = "DiagnosticUnderlineInfo",
		numhl = "LspDiagnosticsSignInformation",
	},
}

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
--
-- vim.keymap.set("n", ";dn", [[<Cmd>lua require'dap'.continue()<CR>]])
-- vim.keymap.set("n", ";db", [[<Cmd>lua require'dap'.toggle_breakpoint()<CR>]])
-- vim.keymap.set("n", ";ds", [[<Cmd>lua require'dap'.stop()<CR>]])
-- vim.keymap.set("n", "<S-k>", [[<Cmd>lua require'dap'.step_out()<CR>]])
-- vim.keymap.set("n", "<S-l>", [[<Cmd>lua require'dap'.step_into()<CR>]])
-- vim.keymap.set("n", "<S-j>", [[<Cmd>lua require'dap'.step_over()<CR>]])
--
-- vim.keymap.set("n", ";di", [[<Cmd>lua local widgets = require'dap.ui.variables'.visual_hover()<CR>]])
-- vim.keymap.set("n", ";de", [[<Cmd>lua require'dap'.set_exception_breakpoints({"all"})<CR>]])

vim.keymap.set("n", ";db", function()
	require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", ";dH", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<C-k>", function()
	require("dap").step_out()
end)
vim.keymap.set("n", "<C-l>", function()
	require("dap").step_into()
end)
vim.keymap.set("n", "<C-j>", function()
	require("dap").step_over()
end)
vim.keymap.set("n", "<C-h>", function()
	require("dap").continue()
end)
vim.keymap.set("n", ";dn", function()
	require("dap").run_to_cursor()
end)
vim.keymap.set("n", ";dc", function()
	require("dap").terminate()
end)
vim.keymap.set("n", ";dR", function()
	require("dap").clear_breakpoints()
end)
vim.keymap.set("n", ";de", function()
	require("dap").set_exception_breakpoints({ "all" })
end)
vim.keymap.set("n", ";da", function()
	require("debugHelper").attach()
end)
vim.keymap.set("n", ";dA", function()
	require("debugHelper").attachToRemote()
end)
vim.keymap.set("n", ";di", function()
	require("dap.ui.widgets").hover()
end)
-- vim.keymap.set("n", ";di", function()
-- 	require("dapui").eval()
-- end)
vim.keymap.set("n", ";d?", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)
vim.keymap.set("n", ";dk", ':lua require"dap".up()<CR>zz')
vim.keymap.set("n", ";dj", ':lua require"dap".down()<CR>zz')
vim.keymap.set("n", ";dr", ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
