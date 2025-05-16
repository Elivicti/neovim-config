return {
	"Mofiqul/vscode.nvim",
	opts = {
		style = "dark",
	},
	config = function (_, opts)
		require("vscode").setup(opts)
	end
}
