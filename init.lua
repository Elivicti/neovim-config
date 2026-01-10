require("core.basic")
require("core.keymap")
require("core.lazy")   -- plugin manager

local color_schemes = {
	tokyonight = {
		name = "tokyonight",
		config = function()
		end
	},
	vscode = {
		name = "vscode",
		config = function()
			vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#FFD700" })
			vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#DA70D6" })
			vim.api.nvim_set_hl(0, "RainbowDelimiterBlue",   { fg = "#179FFF" })
		end
	}
}

local function set_colorscheme(scheme)
	vim.cmd("colorscheme " .. scheme.name)
	scheme.config()
end

set_colorscheme(color_schemes.tokyonight)
