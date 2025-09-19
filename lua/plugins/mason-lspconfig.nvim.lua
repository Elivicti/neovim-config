return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	opts = {},
	config = function (_, opts)
		local mason_lspconfig = require("mason-lspconfig")
		local registry        = require("mason-registry")
		local lsp_name_map    = mason_lspconfig.get_mappings().package_to_lspconfig
		mason_lspconfig.setup(opts)

		local function setup_lsp(name, config)
			local lsp_name = lsp_name_map[name]
			if not lsp_name then
				vim.api.nvim_echo({
					{ "Failed to setup lsp: " .. name .. " is not a valid lsp name\n", "ErrorMsg" },
				}, true, {})
				return
			end

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
			config = vim.tbl_deep_extend("force",
				vim.lsp.config[lsp_name],
				config,
				{ capabilities = blink_capabilities }
			)

			vim.lsp.config[lsp_name] = config;
		end

		local language_servers = require("configs.language-servers")
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
