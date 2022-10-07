local keymap = vim.keymap
-- Save to clipboard
keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>yy", '"+yy')
keymap.set("n", "<leader>p", '"+p')

-- x does not copy in buffer
-- keymap.set("n", "x", '"_x')

-- Delete a word backwards
-- keymap.set('n', 'dw', 'vb"_d')

keymap.set("n", "<C-e>", ":b ")
-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Unhilight
keymap.set("n", "//", "<Cmd>nohlsearch<Cr>")

-- Upper/lower word
keymap.set("n", "<leader>u", "mQviwU`Q")
keymap.set("n", "<leader>l", "mQviwu`Q")

-- Save file and exit to normal mode
keymap.set("i", "jj", "<Cmd>:w<Cr><Esc>")

-- Leader keymap
vim.g.mapleader = " "
