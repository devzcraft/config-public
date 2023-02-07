local status, nvimTmux = pcall(require, "nvim-tmux-navigation")

if not status then
	return
end

nvimTmux.setup({
	keybindings = {
		left = "<C-h>",
		down = "<C-j>",
		up = "<C-k>",
		right = "<C-l>",
		last_active = "<C-\\>",
		next = "<C-Space>",
	},
})
