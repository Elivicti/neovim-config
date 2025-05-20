return {
	"HiPhish/rainbow-delimiters.nvim.git",
	url = "git@gitlab.com:HiPhish/rainbow-delimiters.nvim.git",
	opts = {
		strategy = {
			[''] = 'rainbow-delimiters.strategy.global',
			vim = 'rainbow-delimiters.strategy.local',
		},
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
