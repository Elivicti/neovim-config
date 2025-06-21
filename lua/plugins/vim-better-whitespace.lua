return {
	"ntpeters/vim-better-whitespace",
	opts = {},
	lazy = false,
	config = function() end,
	init = function()
		vim.g.better_whitespace_guicolor="#CC4444"
	end,
	keys = {
		{ "<C-k><C-x>", "<Cmd>StripWhitespace<CR>" }
	}
}
