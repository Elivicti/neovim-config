return {
	"andrewferrier/wrapping.nvim",
	url = "git@github.com:andrewferrier/wrapping.nvim.git",
	opts = {
		create_keymaps = false,
		auto_set_mode_filetype_allowlist = {
			"markdown", "text", "yaml", "asciidoc",
			"gitcommit", "help"
		}
	},
	config = function(_, opts)
		require("wrapping").setup(opts)
	end,
	-- enabled = false
}
