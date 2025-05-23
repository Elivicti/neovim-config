return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
    },
	event = "VeryLazy",
	opts = {
		options = {
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators   = { left = "", right = "" },
		},
		extensions = { "nvim-tree" },
	},
	config = function(_, opts)
		local components = require("configs.lualine-components")

		opts.sections = {
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
						dos  = "CRLF"
					}
				},
				"filetype",
			},
			lualine_y = {
				"progress",
				-- "location",
			},
			lualine_z = {
				components.datetime
			}
		}

		require("lualine").setup(opts)
	end
}
