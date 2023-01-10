vim.t_Co = 256
vim.opt.termguicolors = true

require('rose-pine').setup({
	dark_variant = 'moon',
  highlight_groups = {
    Character = { fg = 'rose' },
    String = { fg = 'rose' }
  }
})

local hr = tonumber(os.date('%H', os.time()))
if hr > 6 and hr < 18 then -- local time between 6AM and 5PM
  vim.opt.background = "light"
else
  vim.opt.background = "dark"
end
vim.cmd("colorscheme rose-pine")

-- UI improvements
require('dressing').setup()
