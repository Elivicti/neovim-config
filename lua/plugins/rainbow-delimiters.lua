return {
	"HiPhish/rainbow-delimiters.nvim.git",
	url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git",
	opts = {
		strategy = {
			[''] = 'rainbow-delimiters.strategy.global',
			vim = 'rainbow-delimiters.strategy.local',
		},
		-- query = {
		-- 	[''] = 'rainbow-delimiters',
		-- 	lua = 'rainbow-blocks',
		-- },
		-- priority = {
		-- 	[''] = 110,
		-- 	lua = 210,
		-- },
		highlight = {
			-- "RainbowDelimiterRed",
			"RainbowDelimiterYellow",
			"RainbowDelimiterViolet",
			"RainbowDelimiterBlue",
			-- "RainbowDelimiterOrange",
			-- "RainbowDelimiterGreen",
			-- "RainbowDelimiterViolet",
			-- "RainbowDelimiterCyan",
		},
	},
	config = function (_, opts)
		require("rainbow-delimiters.setup").setup(opts);
	end
}
