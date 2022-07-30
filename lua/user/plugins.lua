local packer = require("packer")

return packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'morhetz/gruvbox'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
end)
