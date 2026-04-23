vim.o.laststatus = 2
vim.o.autoindent = true
vim.o.relativenumber = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.scrolloff = 30
vim.o.clipboard = "unnamed,unnamedplus"
vim.o.updatetime = 1000
vim.opt.iskeyword:append("-")
vim.o.spelllang = "es,en"
vim.o.spelloptions = "camel"
vim.opt.complete:append("kspell")
vim.o.path = vim.o.path .. ",**"
vim.o.tags = vim.o.tags .. ",/home/tao/.config/nvim/tags"
vim.o.pumborder = "rounded"
vim.o.foldlevel = 10
