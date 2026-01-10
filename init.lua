require("core.basic")
require("core.keymap")
require("core.lazy")   -- plugin manager

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function ()
		vim.schedule(function ()
			if vim.fn.argc() == 0 then
				vim.cmd("edit .")
			end
		end)
	end
})

vim.cmd.colorscheme("tokyonight")
