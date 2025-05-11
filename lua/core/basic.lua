
vim.opt.number         = true  -- line number
vim.opt.relativenumber = true  -- show line number relative to current line
vim.opt.cursorline     = true  -- highlight current line

vim.opt.tabstop        = 4     -- tab size
vim.opt.shiftwidth     = 0     -- tab size at line start, 0 means stay same with tabstop

vim.opt.autoread       = true  -- auto reload file if it's modified by other programs

vim.opt.splitbelow     = false -- if horizontal split window should show below current window
vim.opt.splitright     = true  -- if vertical split window should show right to current window

vim.opt.ignorecase     = true  -- ignore case when search
vim.opt.smartcase      = true  -- if input contains upper case and lower case, case is not ignored
vim.opt.showmode       = false -- show current mode, we have lualine to do that
vim.opt.scrolloff = 5

-- restore cursor style when exiting vim
vim.cmd([[
	augroup RestoreCursorShapeOnExit
		autocmd!
		autocmd VimLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q")
	augroup END
]])
