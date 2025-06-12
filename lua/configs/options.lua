vim.t_Co = 256
vim.opt.termguicolors = true

vim.g.mapleader = ","
vim.g.maplocalleader = ",,"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.autoindent = true
vim.opt.backup = true
vim.opt.backupdir = vim.env.HOME .. "/.cache/nvim"
vim.opt.directory = vim.env.HOME .. "/.cache/nvim"

vim.opt.undodir = vim.env.HOME .. "/.cache/nvim"
vim.opt.undofile = true

vim.opt.clipboard = "unnamedplus"

vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.history = 1000
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.swapfile = false

vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.opt.showtabline = 1 -- without tabline
vim.opt.showbreak = "↪ "

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.opt.completeopt = "menuone"
vim.opt.guicursor = "i:block"
vim.opt.mouse = "a"

-- Cursor shape
-- vim.opt.gcr = 'n-v:block,i-c-ci-ve:blinkoff500-blinkon500-block,r-cr-o:hor20'
-- vim.opt.gcr:append("n-v:block-Cursor/lCursor")
-- vim.opt.gcr:append("i-c-ci-ve:blinkoff500-blinkon500-block-TermCursor/lCursor")
-- vim.opt.gcr:append("r-cr:hor20,o:hor50")

vim.opt.syntax = "enable"
vim.opt.signcolumn = "yes"

vim.opt.list = true
vim.opt.listchars = {
  tab = "→ ",
  extends = "…",
  precedes = "…",
  nbsp = "␣",
  trail = "·",
}
vim.opt.fillchars = {
  fold = "·",
  foldopen = "",
  foldclose = "",
  foldsep = " ",
  diff = "╱",
}

vim.wo.number = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.numberwidth = 1
vim.opt.laststatus = 3
vim.opt.ch = 0

vim.cmd("let g:python3_host_prog = '~/.asdf/shims/python3'")
