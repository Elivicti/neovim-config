-- provides code completion and other

return {
	"saghen/blink.cmp",
	url = "git@github.com:saghen/blink.cmp",
	version = "*",
	event = "VeryLazy",
	opts = {
		completion = {
			documentation = {
				auto_show = true
			}
		},
		keymap = {
			preset = "super-tab",
		},
		sources = {
			default = { "path", "buffer", "lsp" }
		},
		cmdline = {
			sources = function ()
				local cmd_type = vim.fn.getcmdtype()
				if cmd_type == "/" then
					return { "buffer" }
				end
				if cmd_type == ":" then
					return { "cmdline" }
				end
				return {}
			end,
			keymap = {
				preset = "super-tab"
			},
			completion = {
				menu = {
					auto_show = true
				}
			}
		},
	}
}

