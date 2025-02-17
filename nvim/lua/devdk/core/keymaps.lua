local keymap = vim.keymap

vim.g.mapleader = " "
keymap.set("n", "-", vim.cmd.Ex)

local opts = { noremap, silent = true }

-- in Insert and Visual mode map Esc to jk
keymap.set("i", "jk", "<esc>", { desc = "Exit insert mode with jk" })
keymap.set("v", "jk", "<esc>", { desc = "Exit visual mode with jk " })

-- in Visual mode move text with J and K - WERKT NIET
-- keymap.set("x", "J", ":move '>+1gv-gv", opts)
-- keymap.set("x", "K", ":move '<-2gv-gv", opts)

--Clear search high lights -> not needed, in options hlsearch is off
keymap.set("n", "<leader>nh", ":noh<CR>", { desc = "Clear search highlights" })

--Choose a theme
keymap.set("n", "<leader>th", ":Themery<CR>", { desc = "Choose Theme" })

--NvimTree toggle Folderview
keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", opts)
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

--Pane Navigation
keymap.set("n", "<C-h>", "<C-w>h", opts) --Navigate Left
keymap.set("n", "<C-j>", "<C-w>j", opts) --Navigate Down
keymap.set("n", "<C-k>", "<C-w>k", opts) --Navigate Up
keymap.set("n", "<C-l>", "<C-w>l", opts) --Navigate Right

--Window Management
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)          --Split Vertical
keymap.set("n", "<leader>sh", ":split<CR>", opts)           --Split Horizontal
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) --Toggle Minimize

--Toggle spell checker
keymap.set("n", "<leader>sp", ":set spell!<cr>", { desc = "Toggle spell checker" })
