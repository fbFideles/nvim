print(completionCapabilities)

local lsp_server_list = {"sumneko_lua", "gopls"}
for indice in ipairs(lsp_server_list) do
	print(lsp_server_list[indice])

	require("lspconfig")[lsp_server_list[indice]].setup {
		capabilities = completionCapabilities
	}
end
