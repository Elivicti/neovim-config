require("core.basic")
require("core.keymap")
require("core.lazy")   -- plugin manager


local function set_bufferline_highlights()
	vim.api.nvim_set_hl(0, "BufferLineDiagnosticError", { fg = "#db4b4b" })
	vim.api.nvim_set_hl(0, "BufferLineDiagnosticWarn",  { fg = "#e0af68" })
	vim.api.nvim_set_hl(0, "BufferLineDiagnosticInfo",  { fg = "#0db9d7" })
	vim.api.nvim_set_hl(0, "BufferLineDiagnosticHint",  { fg = "#10B981" })
end

local color_schemes = {
	tokyonight = {
		name = "tokyonight",
		config = function()
			set_bufferline_highlights()
		end
	},
	vscode = {
		name = "vscode",
		config = function()
			set_bufferline_highlights()
			vim.cmd("highlight RainbowDelimiterYellow guifg=#FFD700")
			vim.cmd("highlight RainbowDelimiterViolet guifg=#DA70D6")
			vim.cmd("highlight RainbowDelimiterBlue   guifg=#179FFF")
		end
	}
}

local function set_colorscheme(scheme)
	vim.cmd(string.format("colorscheme %s", scheme.name))
	scheme.config()
end

set_colorscheme(color_schemes.tokyonight)
