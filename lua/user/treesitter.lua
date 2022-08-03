local configs = require("nvim-treesitter.configs")
configs.setup {
	ensure_installed = { "c", "cpp", "go", "lua" },
	autoinstall = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = false,
	}
}
