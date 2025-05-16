return {
	"Mofiqul/vscode.nvim.git",
	opts = {
		style = "dark",
	},
	config = function (_, opts)
		require("vscode").setup(opts)
	end
}
