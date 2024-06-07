-- diagnostics and quickfix list plugin
-- require("trouble").setup()

-- Disable virtual text
vim.diagnostic.config({ virtual_text = false })

-- Override diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Keymaps
local opts = { remap = false, silent = true }
vim.keymap.set('n', '<F10>', '<CMD>TroubleToggle<CR>', opts)
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.setloclist() end, opts)
vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
