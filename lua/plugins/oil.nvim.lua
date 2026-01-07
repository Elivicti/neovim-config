local git_config = require("configs.git")

return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	url = git_config.site.github:url("Elivicti/oil.nvim"),
	branch = "feat/dired-alike",
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	---@module "oil"
	---@type oil.SetupOpts
	opts = {
		columns = {
			{ "permissions" },
			{ "nlink", highlight = "Comment" },
			{ "owner", highlight = "Identifier" },
			{ "size",  highlight = "Constant" },
			{ "mtime", format = "%b %e %Y %H:%M" },
			{ "icon",  highlight = "Normal" },
		},
		-- Buffer-local options to use for oil buffers
		buf_options = {
			buflisted = true,
			bufhidden = "wipe",
		},
		keymaps = {
			["g?"] = { "actions.show_help", mode = "n" },
			["<CR>"] = "actions.select",
			["<C-s>"] = {},
			["<C-h>"] = {},
			["<C-t>"] = {},
			["<C-p>"] = "actions.preview",
			["<C-c>"] = { "actions.close", mode = "n" },
			["<C-l>"] = "actions.refresh",
			["-"] = { "actions.parent", mode = "n" },
			["_"] = { "actions.open_cwd", mode = "n" },
			["`"] = { "actions.cd", mode = "n" },
			["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
			["gs"] = { "actions.change_sort", mode = "n" },
			["gx"] = "actions.open_external",
			["g."] = { "actions.toggle_hidden", mode = "n" },
			["g\\"] = { "actions.toggle_trash", mode = "n" },
		},
		view_options = {
			show_hidden = true,
			align_right = true,
			highlight_hidden = false,
		},
		skip_confirm_for_simple_edits = true,
	},
	keys = {
		{
			"<A-o>",
			function ()
				if vim.bo.filetype ~= "oil" and vim.bo.buftype == "" then
					vim.cmd("Oil")
				end
			end,
			silent = true,
			desc = "open dired in current file's directory"
		},
		{
			"<A-p>",
			function ()
				if vim.bo.filetype ~= "oil" then
					vim.cmd("edit .")
				else
					require("oil").open(vim.fn.getcwd())
				end
			end,
			silent = true,
			desc = "open dired in current working directory"
		},
	}
}
