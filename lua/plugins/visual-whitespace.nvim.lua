return {
	"mcauley-penney/visual-whitespace.nvim",
	config = true,
	event = "ModeChanged *:[vV\22]",
	opts = {
		ignore = { filetypes = { "oil" } },
		list_chars = {
			space = "·",
			tab = "▸",
			nbsp = "␣",
			lead = "‹",
			trail = "›",
		},
		fileformat_chars = {
			unix = "",
			mac  = "",
			dos  = "",
		},
	}
}
