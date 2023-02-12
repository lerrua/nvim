vim.g.mapleader = ','

vim.opt.autoindent = true
vim.opt.backup = true
vim.opt.backupdir = vim.env.HOME .. '/.cache/nvim'
vim.opt.directory = vim.env.HOME .. '/.cache/nvim'

vim.opt.undodir = vim.env.HOME .. '/.cache/nvim'
vim.opt.undofile = true

vim.opt.clipboard = "unnamedplus"

vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.history = 1000
vim.opt.ignorecase = true
vim.opt.incsearch = true

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.opt.showtabline = 0 -- without tabline
vim.opt.showbreak = '↪ '

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.opt.guicursor = 'i:block'
vim.opt.mouse = 'a'

vim.opt.syntax = "enable"
vim.opt.signcolumn = "yes"

vim.wo.number = true

vim.opt.numberwidth = 1
vim.opt.laststatus = 3
vim.opt.ch = 0
