local function get_time()
	return os.date("%H:%M:%S", os.time())
end

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
				"encoding",
				"filetype",
			},
			lualine_y = {
				-- "location",
				"progress",
			},
			lualine_z = {
				get_time
			}
		},
	},
}

