local lsp = require('lsp-zero').preset({
	name = 'minimal',
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

local lsp_attach = function(client, bufnr)
	vim.api.nvim_create_autocmd('BufWritePre', {
		callback = function(args)
			vim.lsp.buf.format({ async = false })
		end
	})
end


lsp.ensure_installed({
	'lua_ls',
	'gopls',
	'pyright'
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup({ on_attach = lsp_attach })
