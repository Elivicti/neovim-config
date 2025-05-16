return {
	"andrewferrier/wrapping.nvim",
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
