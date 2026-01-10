return {
	"Mofiqul/vscode.nvim",
	opts = {
		style = "dark",
	},
	config = function (_, opts)
		require("vscode").setup(opts)

		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "vscode",
			callback = function()
				assert(vim.g.colors_name == "vscode")

				vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#FFD700" })
				vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#DA70D6" })
				vim.api.nvim_set_hl(0, "RainbowDelimiterBlue",   { fg = "#179FFF" })
			end
		})
	end
}
