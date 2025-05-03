local diagnostic_icons = {
	error   = { icon = "", hl = "BufferLineDiagnosticError" },
	warning = { icon = "", hl = "BufferLineDiagnosticWarn"  },
	--info    = { icon = "", hl = "BufferLineDiagnosticInfo"  },
	--hint    = { icon = "󰌶", hl = "BufferLineDiagnosticHint"  }
}

return {
    "akinsho/bufferline.nvim",
	url = "git@github.com:akinsho/bufferline.nvim",
    dependencies = {
    	{
			"nvim-tree/nvim-web-devicons",
			url = "git@github.com:nvim-tree/nvim-web-devicons"
		}
	},

	opts = {
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(_, _, diagnostics_dict, _)
    			if vim.tbl_isempty(diagnostics_dict) then return "" end

				local indicator = {}
				for level, count in pairs(diagnostics_dict) do
        			if diagnostic_icons[level] and count > 0 then
           				table.insert(indicator, ("%s%%#%s#%d%s%%*"):format(
                			" ",
							diagnostic_icons[level].hl,
							count,
							diagnostic_icons[level].icon
            			))
        			end
   				end
    			return #indicator > 0 and table.concat(indicator) or ""
			end
		}
	},
	keys = {
		{ "<A-b>",      ":BufferLineCyclePrev<CR>",   silent = true },
		{ "<A-n>",      ":BufferLineCycleNext<CR>",   silent = true },
		{ "<leader>bh", ":BufferLineCyclePrev<CR>",   silent = true }, -- move to previous tab
		{ "<leader>bl", ":BufferLineCycleNext<CR>",   silent = true }, -- move to next tab
		{ "<leader>bd", ":bdelete<CR>",               silent = true }, -- close current tab
		{ "<leader>bo", ":BufferLineCloseOthers<CR>", silent = true }, -- close other tabs
		{ "<leader>bp", ":BufferLinePick<CR>",        silent = true }, -- switch to a certain tab
		{ "<leader>bc", ":BufferLinePickClose<CR>",   silent = true }, -- exit pick mode
	},
	lazy = false -- disable lazy load
}
