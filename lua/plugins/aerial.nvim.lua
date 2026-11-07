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
	spec["branch"] = "nvim-0." .. version.minor
else
	spec["branch"] = "master"
end

return spec
