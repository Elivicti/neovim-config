local diagnostic_icons = {
	error   = { icon = "", hl = "BufferLineDiagnosticError" },
	warning = { icon = "", hl = "BufferLineDiagnosticWarn"  },
	-- info    = { icon = "", hl = "BufferLineDiagnosticInfo"  },
	-- hint    = { icon = "󰌶", hl = "BufferLineDiagnosticHint"  }
}

if vim.env.NVIM_USING_BIG_ICON_FONT then
	for _, value in pairs(diagnostic_icons) do
		value.icon = value.icon .. " "
	end
end

local git_config = require("configs.git")

return {
	"akinsho/bufferline.nvim",
	url = git_config.site.github:url("Elivicti/bufferline.nvim"),
	branch = "fix-highlighted-strwidth",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
			max_name_length = 20,
			tab_size = 20,
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(_, _, diagnostics_dict, _)
				if vim.tbl_isempty(diagnostics_dict) then return "" end

				local indicators = ""
				for level, count in pairs(diagnostics_dict) do
					if not (diagnostic_icons[level] and count > 0) then
						goto continue
					end
					indicators = indicators .. string.format(
						" %%#%s#%s%d%%*",
						diagnostic_icons[level].hl,
						diagnostic_icons[level].icon, count
					)
					::continue::
				end
				return indicators
			end,
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "center",
				},
			},
			name_formatter = function(buf)
				-- buf contains:
				  -- name                | str        | the basename of the active file
				  -- path                | str        | the full path of the active file
				  -- bufnr               | int        | the number of the active buffer
				  -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
				  -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
				plog(vim.inspect(buf))

				if buf.path:match("oil://") then
					local dir = require("oil").get_current_dir(buf.bufnr)
					if dir then
						local path = dir:gsub("/+$", "")
						return vim.fn.fnamemodify(path, ":t") .. "/"
					else
						return buf.name
					end
				end
			end,
			get_element_icon = function(element)
				-- element contains:
				  -- filetype    | string
				  -- path        | string
				  -- extension   | string
				  -- directory   | string
				if element.filetype == "oil" then
					return "\u{f4d4}"
				end
			end
		}
	},
	keys = {
		{ "<A-b>",      ":BufferLineCyclePrev<CR>",   silent = true },
		{ "<A-n>",      ":BufferLineCycleNext<CR>",   silent = true },
		{ "<leader>bh", ":BufferLineCyclePrev<CR>",   silent = true }, -- move to previous tab
		{ "<leader>bl", ":BufferLineCycleNext<CR>",   silent = true }, -- move to next tab
		{ "<leader>bq", ":bdelete<CR>",               silent = true }, -- close current tab
		{ "<leader>bo", ":BufferLineCloseOthers<CR>", silent = true }, -- close other tabs
		{ "<leader>bp", ":BufferLinePick<CR>",        silent = true }, -- switch to a certain tab
		{ "<leader>bb", ":BufferLinePick<CR>",        silent = true }, -- switch to a certain tab
		{ "<leader>bd", ":BufferLinePickClose<CR>",   silent = true }, -- exit pick mode
	},
	lazy = false -- disable lazy load
}
