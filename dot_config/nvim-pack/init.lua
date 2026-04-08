vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.o.number = true
vim.o.signcolumn = "yes"

vim.o.mouse = "a"

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.inccommand = "split"

vim.o.cursorline = true

vim.o.scrolloff = 10
