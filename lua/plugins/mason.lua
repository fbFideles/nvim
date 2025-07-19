return {
    "mason-org/mason.nvim",
	config = function()
		require('mason').setup{}
		local mason_registry = require("mason-registry")
		for _, pkg in ipairs(mason_registry.get_installed_packages()) do
	    	vim.lsp.enable(pkg.name)
		end
	end,
	dependencies = {
		{ "folke/neodev.nvim"}
	},
    opts = {}
}
