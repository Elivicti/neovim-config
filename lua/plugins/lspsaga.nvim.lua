return {
	"nvimdev/lspsaga.nvim",
	cmd = "Lspsage",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		finder = {
			keys = {
				toggle_or_open = "<CR>"
			}
		},
		lightbulb = {
			sign = false
		}
	},
	keys = {
		{ "<leader>lr", "<Cmd>Lspsaga rename<CR>" },
		{ "<leader>lc", "<Cmd>Lspsaga code_action<CR>" },
		{ "<leader>ld", "<Cmd>Lspsaga goto_definition<CR>" },
		{ "<leader>lk", "<Cmd>Lspsaga hover_doc<CR>" }
	}
}
