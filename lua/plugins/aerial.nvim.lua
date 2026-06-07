local spec = {
	"stevearc/aerial.nvim",
	lazy = true,
	cmd = "AerialToggle",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons"
	},
	opts = {},
}

local version = vim.version()
if version.minor <= 11 then
	spec["tag"] = "v3.1.0"
else
	spec["branch"] = "main"
end

return spec
