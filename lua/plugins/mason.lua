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
	}
}

return {
	"mason-org/mason.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig",
	},
	event = "VeryLazy",
	opts = {},
	config = function (_, opts)
		require("mason").setup(opts)
		local registry     = require("mason-registry")
		local lsp_name_map = require("mason-lspconfig").get_mappings().package_to_lspconfig
		local lspconfig    = require("lspconfig")

		local function setup_lsp(name, config)
			local success, package = pcall(registry.get_package, name)
			if not success then
				vim.api.nvim_echo({
					{ "Failed to setup lsp: " .. name .. "\n", "ErrorMsg" },
					{ vim.inspect(package), "ErrorMsg" },
					{ "\n" },
				}, true, {})
				return
			end
			if not package:is_installed() then
				package:install()
			end
			local blink_capabilities = require("blink.cmp").get_lsp_capabilities()
			config = vim.tbl_deep_extend("force", config, {
				capabilities = blink_capabilities,
			})

			lspconfig[lsp_name_map[name]].setup(config) -- somehow needs to call setup twice???
			lspconfig[lsp_name_map[name]].setup(config)
		end

		for lsp, config in pairs(language_servers) do
			setup_lsp(lsp, config)
		end

		vim.diagnostic.config({
			virtual_text     = true,  -- show warning or error message
			virtual_lines    = false, -- show warning or error message in mutiple lines
			update_in_insert = true,  -- update diagnostic when edited in insert mode
		})
	end
}
