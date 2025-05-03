return {
	"nvim-lualine/lualine.nvim",
	url = "git@github.com:nvim-lualine/lualine.nvim",
	dependencies = {
		{
			"nvim-tree/nvim-web-devicons",
			url = "git@github.com:nvim-tree/nvim-web-devicons"
		},
    },
	event = "VeryLazy",
	opts = {
	options = {
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		extensions = { "nvim-tree" },
		sections = {
			lualine_b = { "branch", "diff" },
			lualine_x = {
				"filesize",
				"encoding",
				"filetype",
			},
		},
	},
}

