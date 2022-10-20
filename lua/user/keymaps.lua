local function map(mode, keybinding, command, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, keybinding, command, options)
end

-- some autocommands
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

-- map("n", ",<Space>", ":nohlsearch<CR>", { silent = true })
map("n", "<C-e>", ":NERDTreeToggle<CR>", { noremap = true })
map("n", "<C-ç", "C-6", { noremap = true })
map("n", "<C-p>", ":lua require('telescope.builtin').find_files()<CR>", { noremap = true, silent = true })
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
