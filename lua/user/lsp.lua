local lsp_server_list = {"sumneko_lua", "gopls", "tsserver", "eslint", "jedi_language_server", "ccls"}
for indice in ipairs(lsp_server_list) do
	require("lspconfig")[lsp_server_list[indice]].setup {
		capabilities = completionCapabilities
	}
end
