local lsp_server_list_from_installed = require('nvim-lsp-installer.servers').get_installed_server_names()

local lsp_config = require('lspconfig')
for i in ipairs(lsp_server_list_from_installed) do
	local server = lsp_server_list_from_installed[i]
	lsp_config[server].setup {
		capabilities = completionCapabilities
	}
end
