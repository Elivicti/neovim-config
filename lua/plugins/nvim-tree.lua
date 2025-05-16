return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			width = 30,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = false,
		},
		git = {
			enable  = true,
			ignore  = false,
			timeout = 500
		}
	},
	keys = {
		{ "<leader>tf", "<Cmd>NvimTreeFocus<CR>" },
		{ "<leader>tt", "<Cmd>NvimTreeToggle<CR>" },
	}
}
