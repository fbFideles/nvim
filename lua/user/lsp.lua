local lsp_server_list = {"sumneko_lua", "gopls"}
for indice in ipairs(lsp_server_list) do
	require("lspconfig")[lsp_server_list[indice]].setup {
		capabilities = completionCapabilities
	}
end
