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
		{ "<leader>ld", "<Cmd>Lspsaga goto_definition<CR>" },
		{ "<leader>lk", "<Cmd>Lspsaga hover_doc<CR>" },
		{ "<leader>ll", "<Cmd>Lspsaga show_line_diagnostics<CR>" },
		{ "<leader>la", "<Cmd>Lspsaga code_action<CR>" },
		{ "<M-.>", "<Cmd>Lspsaga diagnostic_jump_next<CR>" },
		{ "<M-,>", "<Cmd>Lspsaga diagnostic_jump_prev<CR>" },
	}
}
