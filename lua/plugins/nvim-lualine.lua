local function get_time()
	return os.date("%H:%M", os.time())
end

local components = require("configs.lualine-components")

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
			section_separators   = { left = "", right = "" },
		},
		extensions = { "nvim-tree" },
		sections = {
			lualine_b = { "branch", "diff" },
			lualine_c = {
				components.filename,
				components.cmake.configure_preset,
				components.cmake.build_target,
				components.cmake.debug,
				components.cmake.launch
			},
			lualine_x = {
				"encoding",
				{
					"fileformat",
					symbols = {
						unix = "LF",
						mac  = "CR",
						dox  = "CRLF"
					}
				},
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

		-- winbar = {
		-- 	lualine_x = {
		-- 		components.cmake.launch,
		-- 		components.cmake.debug,
		-- 	},
		-- 	lualine_y = {
		-- 		components.cmake.build_target
		-- 	},
		-- 	lualine_z = {
		-- 		components.cmake.configure_preset,
		-- 	},
		-- }
	},
}
