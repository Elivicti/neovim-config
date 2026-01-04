local git_config = require("configs.git")

return {
	"benomahony/oil-git.nvim",
	dependencies = { "stevearc/oil.nvim" },
	url = git_config.site.github:url("Elivicti/oil-git.nvim"),
	branch = "fix/git-dotfile-detection",
}
