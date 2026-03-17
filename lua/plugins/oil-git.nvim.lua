local symbols = {
	added     = "+",
	modified  = "~",
	renamed   = "^",
	deleted   = "#",
	copied    = "&",
	conflict  = "!",
	untracked = "?",
	ignored   = ""
}

return {
	"malewicz1337/oil-git.nvim",
	dependencies = { "stevearc/oil.nvim" },
	opts = {
		show_ignored_files = true,
		show_ignored_directories = true,
		symbols = {
			file = symbols,
			directory = symbols,
		},
	},
}
