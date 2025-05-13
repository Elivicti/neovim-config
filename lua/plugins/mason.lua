return {
	"mason-org/mason.nvim",
	url = "git@github.com:mason-org/mason.nvim",
	dependencies = {
		{
			"neovim/nvim-lspconfig",
			url = "git@github.com:neovim/nvim-lspconfig"
		},
		{
			"mason-org/mason-lspconfig",
			url = "git@github.com:williamboman/mason-lspconfig"
		}
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
					{ package, "ErrorMsg" },
					{ "\n" },
				}, true, {})
				return
			end
			if not package:is_installed() then
				package:install()
			end
			config.capabilities = require("blink.cmp").get_lsp_capabilities()
			lspconfig[lsp_name_map[name]].setup(config)
		end

		local language_servers = {
			["lua-language-server"] = {
				settings = {
        			Lua = {
            			diagnostics = { globals = { "vim" }, },
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

		for lsp, config in pairs(language_servers) do
			setup_lsp(lsp, config)
		end

		vim.cmd("LspStart")
		vim.diagnostic.config({
			virtual_text     = true, -- show warning or error message
			virtual_lines    = true, -- show warning or error message in mutiple lines
			update_in_insert = true, -- update diagnostic when edited in insert mode
		})
	end
}
