vim.t_Co = 256
vim.o.termguicolors = true

-- commentary
require('Comment').setup()

-- colorscheme
vim.cmd "colorscheme rosebones"
vim.opt.background = "light"

-- tabs UI
require("bufferline").setup()
vim.keymap.set('n', '<Tab>', 'gt')
vim.keymap.set('n', '<S-Tab>', 'gT')
vim.keymap.set('n', '<S-t>', ':tabnew<CR>')
vim.keymap.set('n', '<leader>z', ':tabnew %<CR>')

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
require("trouble").setup()
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
