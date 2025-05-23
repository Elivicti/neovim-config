return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- force update parser
	opts = {
		ensure_installed = {
			"lua", "c", "cpp", "python", "vimdoc", "markdown",
		},
		highlight = { enable = true }
	},
	config = function (_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end
}
