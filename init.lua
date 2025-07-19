vim.hl = vim.highlight -- remove when past v0.10.4

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false

vim.keymap.set('n', '<C-p>', '<C-6>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

require('config.lazy')
