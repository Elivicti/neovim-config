
vim.keymap.set({ "n", "i" }, "<C-z>", "<Cmd>undo<CR>", { silent = true })
vim.keymap.set({ "n", "i" }, "<C-r>", "<Cmd>redo<CR>", { silent = true })
-- vim.keymap.set({ "n", "i" }, "<C-x>", "dd", { silent = true })


vim.keymap.set("n", "j", "k", { remap = false }) -- swap up and down
vim.keymap.set("n", "k", "j", { remap = false })

vim.keymap.set({ "n", "i" }, "<C-s>", "<Cmd>write<CR>", { })

-- open terminal mode, the tailing `i` is needed
vim.keymap.set("n", "<C-t>", "<Cmd>terminal<CR>i", { silent = true })


-- note: may be needed for lazy.nvim?
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
