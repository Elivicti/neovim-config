return {
	"chrisgrieser/nvim-origami",
	opts = {
		autoFold = {
			enabled = false,
		},
		foldKeymaps = {
			setup = false, -- modifies `h`, `l`, and `$`
		},
	},
	init = function()
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99
	end,
}
