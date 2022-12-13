vim.t_Co = 256
vim.o.termguicolors = true

vim.cmd "colorscheme rosebones"
vim.opt.background = "light"


require("indent_blankline").setup {
  show_current_context = true,
}
