local spec = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- force update parser
	opts = {
		ensure_installed = {
			"lua", "c", "cpp", "python", "vimdoc", "markdown",
		},
		highlight = { enable = true }
	},
}

local version = vim.version()
if version.minor <= 11 then
	spec["branch"] = "master"
else
	spec["branch"] = "main"
end

return spec
