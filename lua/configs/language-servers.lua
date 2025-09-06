
local language_servers = {
	["lua-language-server"] = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" }, },
				workspace = {
					-- make lsp aware of nvim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				}
			}
		}
	},
	pyright = {},
	["cmake-language-server"] = {},
	clangd = {
		cmd = {
			"clangd",
			"--compile-commands-dir="  .. vim.fn.getcwd() .. "/build/",
			"--header-insertion=never",
			"--background-index"
		},
		filetypes = { "c", "cpp", "objc", "objcpp" }
	},
	["json-lsp"] = {},
	["bash-language-server"] = {},
}


return language_servers
