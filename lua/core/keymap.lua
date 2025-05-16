-- needed for plugin keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local silent  = { silent = true }
local noremap = { silent = true, noremap = true }


vim.keymap.set({ "n", "i", "v" }, "<C-z>", "<Cmd>undo<CR>",     silent)
vim.keymap.set({ "n", "i", "v" }, "<C-r>", "<Cmd>redo<CR>",     silent)
vim.keymap.set({ "n", "i" },      "<C-x>", "<Cmd>norm dd<CR>",  silent)

vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<Cmd>write<CR><Esc>", { })

-- open terminal mode, the tailing `i` is needed
vim.keymap.set("n", "<A-t>", "<Cmd>terminal<CR>i", silent)

-- Ctrl+c copys to system clipboard
vim.keymap.set("n", "<C-c>", '"+yy', silent)
vim.keymap.set("v", "<C-c>", '"+y',  silent)

-- Ctrl+/ toggles comment line
vim.keymap.set({ "n", "i" }, "<C-_>", "<Cmd>norm gcc<CR>", noremap)
vim.keymap.set("v",          "<C-_>", "<Cmd>norm gc<CR>",  noremap)

-- swap Ctrl+Arrow and Shift+Arrow
vim.keymap.set({ "n", "v" }, "<S-Left>",  "<C-Left>",  noremap)
vim.keymap.set({ "n", "v" }, "<S-Right>", "<C-Right>", noremap)
vim.keymap.set({ "n", "v" }, "<S-Up>",    "<C-Up>",    noremap)
vim.keymap.set({ "n", "v" }, "<S-Down>",  "<C-Down>",  noremap)
--
vim.keymap.set({ "n", "v" }, "<C-Left>",  "<S-Left>",  noremap)
vim.keymap.set({ "n", "v" }, "<C-Right>", "<S-Right>", noremap)
vim.keymap.set({ "n", "v" }, "<C-Up>",    "<S-Up>",    noremap)
vim.keymap.set({ "n", "v" }, "<C-Down>",  "<S-Down>",  noremap)
