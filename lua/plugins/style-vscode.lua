return {
	"Mofiqul/vscode.nvim.git",
	url = "git@github.com:Mofiqul/vscode.nvim.git",
	opts = {
		style = "dark",
	},
	config = function (_, opts)
		require("vscode").setup(opts)
		-- vim.cmd("colorscheme vscode")
		vim.api.nvim_set_hl(0, "BufferLineDiagnosticError", { fg = "#db4b4b" })
		vim.api.nvim_set_hl(0, "BufferLineDiagnosticWarn",  { fg = "#e0af68" })
		vim.api.nvim_set_hl(0, "BufferLineDiagnosticInfo",  { fg = "#0db9d7" })
		vim.api.nvim_set_hl(0, "BufferLineDiagnosticHint",  { fg = "#10B981" })
	end
}
