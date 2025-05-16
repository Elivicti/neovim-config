return {
	"Civitasv/cmake-tools.nvim",
	-- url = "git@github.com:Elivicti/cmake-tools.nvim.git", -- my dev fork
	-- branch = "feature-configurable-compile_commands-action",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	opts = {
		cmake_regenerate_on_save = false,  -- auto configure when CMakeLists.txt is saved
		cmake_build_directory = "build/${variant:buildType}",
		cmake_compile_commands_options = {
			action = "copy",
			target = vim.fn.getcwd() .. "/build/"
		},
		cmake_runner = {
			name = "toggleterm"
		},
	},
}
