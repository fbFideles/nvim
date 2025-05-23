return {
	{
		'neovim/nvim-lspconfig',
		enabled = true,
		config = function()
			local lspconfig = require 'lspconfig'
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
			lspconfig.pyright.setup {
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "openFilesOnly",
						useLibraryCodeForTypes = true,
						typeCheckingMode = 'on'
					}
				}
			}
			do
				vim.keymap.set('n', 'grn', function()
					vim.lsp.buf.rename()
				end, { desc = 'vim.lsp.buf.rename()' })
				vim.keymap.set({ 'n', 'x' }, 'gra', function()
					vim.lsp.buf.code_action()
				end, { desc = 'vim.lsp.buf.code_action()' })
				vim.keymap.set('n', 'grr', function()
					vim.lsp.buf.references()
				end, { desc = 'vim.lsp.buf.references()' })
				vim.keymap.set('n', 'gri', function()
					vim.lsp.buf.implementation()
				end, { desc = 'vim.lsp.buf.implementation()' })
				vim.keymap.set('n', 'gO', function()
					vim.lsp.buf.document_symbol()
				end, { desc = 'vim.lsp.buf.document_symbol()' })
				vim.keymap.set({ 'i', 's' }, '<C-S>', function()
					vim.lsp.buf.signature_help()
				end, { desc = 'vim.lsp.buf.signature_help()' })
			end
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp", { clear = true }),
				callback = function(args)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = args.buf,
						callback = function()
							vim.lsp.buf.format { async = false, id = args.data.client_id }
						end,
					})
				end
			})
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
