return {
	{
		"nvim-treesitter/nvim-treesitter",
		enabled = true,
		build = ":TSUpdate",
		config = function()
			vim.g.additional_vim_regex_highlighting = 'off'
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	}
}
