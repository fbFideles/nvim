return {
	{
		'neovim/nvim-lspconfig',
		enabled = true,
		config = function()
			local lspconfig = require'lspconfig'

			lspconfig.lua_ls.setup {}
			lspconfig.gopls.setup({
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						gofumpt = true,
					},
				},
			})

			vim.keymap.set('n', 'grn', function()
				vim.lsp.buf.rename()
			end, { desc = 'vim.lsp.buf.rename()' })

			vim.keymap.set({ 'n', 'x' }, 'gra', function()
				vim.lsp.buf.code_action()
			end, { desc = 'vim.lsp.buf.code_action()' })

			vim.keymap.set('n', 'grr', function()
				vim.lsp.buf.references()
			end, { desc = 'vim.lsp.buf.references()' })

			vim.keymap.set('i', '<C-S>', function()
				vim.lsp.buf.signature_help()
			end, { desc = 'vim.lsp.buf.signature_help()' })
		end,
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},

		}
	}
}
