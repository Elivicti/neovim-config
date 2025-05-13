
vim.keymap.set({ "n", "i", "v" }, "<C-z>", "<Cmd>undo<CR>", { silent = true })
vim.keymap.set({ "n", "i", "v" }, "<C-r>", "<Cmd>redo<CR>", { silent = true })
vim.keymap.set("n", "<C-x>",      "dd",  { silent = true })
vim.keymap.set("i", "<C-x>", "<Esc>ddi", { silent = true }) -- execute "dd" in insert mode


vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<Cmd>write<CR><Esc>", { })

-- open terminal mode, the tailing `i` is needed
vim.keymap.set("n", "<A-t>", "<Cmd>terminal<CR>i", { silent = true })


local opts = { noremap = true, silent = true }

-- swap Ctrl+Arrow and Shift+Arrow
vim.keymap.set({ "n", "v" }, "<S-Left>",  "<C-Left>",  opts)
vim.keymap.set({ "n", "v" }, "<S-Right>", "<C-Right>", opts)
vim.keymap.set({ "n", "v" }, "<S-Up>",    "<C-Up>",    opts)
vim.keymap.set({ "n", "v" }, "<S-Down>",  "<C-Down>",  opts)
--
vim.keymap.set({ "n", "v" }, "<C-Left>",  "<S-Left>",  opts)
vim.keymap.set({ "n", "v" }, "<C-Right>", "<S-Right>", opts)
vim.keymap.set({ "n", "v" }, "<C-Up>",    "<S-Up>",    opts)
vim.keymap.set({ "n", "v" }, "<C-Down>",  "<S-Down>",  opts)

-- needed for plugin keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = ","
