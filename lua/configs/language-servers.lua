
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

local has_opt, opt_ls = pcall(require, "configs.language-servers-opt")
if not has_opt or (type(opt_ls) ~= "table") then
	opt_ls = {}
end

return vim.tbl_deep_extend("force", language_servers, opt_ls)
