require("trouble").setup()

-- Override diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


local opts = { remap = false, silent = true }
vim.keymap.set('n', '<F10>', '<CMD>TroubleToggle<CR>', opts)
