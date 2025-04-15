-- diagnostics and quickfix list plugin
require("trouble").setup()

-- Disable virtual text
vim.diagnostic.config({ virtual_text = false })

-- Override diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Keymaps
vim.keymap.set('n', '<F9>', '<CMD>Trouble diagnostics toggle<CR>', { desc = "Diagnostics (Trouble)" })
