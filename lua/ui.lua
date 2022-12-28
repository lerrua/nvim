vim.t_Co = 256
vim.o.termguicolors = true

-- Colorscheme settings
local hr = tonumber(os.date('%H', os.time()))
if hr > 7 and hr < 17 then -- local time between 7AM and 5PM
  vim.opt.background = "light"
  vim.cmd "colorscheme rosebones"
else
  vim.opt.background = "dark"
  vim.g.zenbones = { darkness = 'warm', lighten_comments = 48 }
  vim.cmd "colorscheme zenbones"
end

-- Tabs UI
require("bufferline").setup()
vim.keymap.set('n', '<Tab>', 'gt')
vim.keymap.set('n', '<S-Tab>', 'gT')
vim.keymap.set('n', '<S-t>', ':tabnew<CR>')
vim.keymap.set('n', '<leader>z', ':tabnew %<CR>')
