
vim.opt.number         = true  -- line number
vim.opt.relativenumber = false -- show line number relative to current line
vim.opt.cursorline     = true  -- highlight current line

vim.opt.tabstop        = 4     -- tab size
vim.opt.shiftwidth     = 0     -- tab size at line start, 0 means stay same with tabstop

vim.opt.autoread       = true  -- auto reload file if it's modified by other programs

vim.opt.splitbelow     = false -- if horizontal split window should show below current window
vim.opt.splitright     = true  -- if vertical split window should show right to current window

vim.opt.ignorecase     = true  -- ignore case when search
vim.opt.smartcase      = true  -- if input contains upper case and lower case, case is not ignored

vim.opt.showmode       = false -- show current mode, we have lualine to do that
vim.opt.scrolloff      = 5

-- restore cursor style when exiting vim
vim.cmd([[
	augroup RestoreCursorShapeOnExit
		autocmd!
		autocmd VimLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q")
	augroup END
]])

-- set default shell to powershell on windows
if jit.os == "Windows" then
	if vim.fn.executable("pwsh") == 1 then
		vim.opt.shell = "pwsh"
	else
		vim.opt.shell = "powershell"
	end

	vim.opt.shellcmdflag =
		"-NoLogo "                       ..
		"-NonInteractive "               ..
		"-ExecutionPolicy RemoteSigned " ..
		"-Command "                      ..
			"[Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();" ..
			"$PSDefaultParameterValues['Out-File:Encoding']='utf8';"                                ..
			"$PSStyle.OutputRendering='plaintext';"                                                 ..
			"Remove-Alias -Force -ErrorAction SilentlyContinue tee;"

	vim.opt.shellredir = [[ 2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode ]]
	vim.opt.shellpipe  = [[ 2>&1 | %%{ "$_" } | tee %s;      exit $LastExitCode ]]

	vim.opt.shellquote  = ""
	vim.opt.shellxquote = ""
end

