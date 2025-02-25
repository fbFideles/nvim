vim.hl = vim.highlight -- remove when past v0.10.4

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false

vim.keymap.set('n', '<C-p>', '<C-6>')

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.go",
	callback = function()
		local filename = vim.fn.expand('%')
		vim.api.nvim_command(":silent:!goimports -w "..filename)
		vim.api.nvim_command(":silent:e")
	end
})

require('config.lazy')
