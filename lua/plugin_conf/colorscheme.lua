vim.t_Co = 256
vim.o.termguicolors = true

-- colorscheme
vim.cmd "colorscheme rosebones"
vim.opt.background = "light"

-- indent column colors
require("indent_blankline").setup {
  show_current_context = true,
}

-- Override python icon colorset
require("nvim-web-devicons").set_icon {
  py = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Py"
  }
}

-- Override diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
