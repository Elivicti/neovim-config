return {
	"folke/tokyonight.nvim",
	url = "git@github.com:folke/tokyonight.nvim",
	opts = {
		style = "night",
	},
	config = function (_, opts)
		require("tokyonight").setup(opts)
	end
}
