local keymap = vim.keymap

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

-- Move window
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")
keymap.set("", "sr", "<C-w>r")

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

-- Normal mode
keymap.set("i", "jj", "<Esc>")

-- Save file
keymap.set("i", "kk", "<Cmd>:w<Cr><Esc>")
