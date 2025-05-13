
vim.keymap.set({ "n", "i", "v" }, "<C-z>", "<Cmd>undo<CR>", { silent = true })
vim.keymap.set({ "n", "i", "v" }, "<C-r>", "<Cmd>redo<CR>", { silent = true })
-- vim.keymap.set({ "n", "i" }, "<C-x>", "dd", { silent = true })


vim.keymap.set({ "n", "i" }, "<C-s>", "<Cmd>write<CR><Esc>", { })

-- open terminal mode, the tailing `i` is needed
vim.keymap.set("n", "<C-t>", "<Cmd>terminal<CR>i", { silent = true })


-- note: may be needed for lazy.nvim?
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
