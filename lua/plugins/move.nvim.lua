-- move line, block up and down

return {
	"fedepujol/move.nvim",
	opts = {
		word = { enable = false },
		char = { enable = true }
	},
	keys = {
		-- Normal Mode
		{ "<A-Up>",    "<Cmd>MoveLine(-1)<CR>",   desc = "Move Line Up" },
		{ "<A-Down>",  "<Cmd>MoveLine( 1)<CR>",   desc = "Move Line Down" },
		-- Visual Mode
		{ "<A-Up>",    "<Cmd>MoveBlock(-1)<CR>",  mode = { "v" }, desc = "Move Block Up" },
		{ "<A-Down>",  "<Cmd>MoveBlock( 1)<CR>",  mode = { "v" }, desc = "Move Block Down" },
		{ "<A-Left>",  "<Cmd>MoveHBlock(-1)<CR>", mode = { "v" }, desc = "Move Block Left" },
		{ "<A-Right>", "<Cmd>MoveHBlock( 1)<CR>", mode = { "v" }, desc = "Move Block Right" },
	}
}
