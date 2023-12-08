require("utils")

-- UI
vim.t_Co = 256
vim.opt.termguicolors = true
vim.opt.background = "light"
local colorscheme = 'zenbones'
-- other colorscheme options
-- local colorscheme = 'rosebones'
-- local colorscheme = 'catppuccin-frappe'
-- local colorscheme = 'catppuccin-latte'

local hr = tonumber(os.date('%H', os.time()))
if hr > 18 or hr < 7 then -- dark mode on local time between 6PM and 7AM
  vim.opt.background = "dark"
end

require("catppuccin").setup {
  integrations = {
    notify = true,
  },
  styles = {
    strings = { "italic" },
  },
  custom_highlights = function(colors)
    return {
      WinBar = { fg = colors.rosewater, bg = colors.mantle, style = { 'italic' } },
    }
  end
}

vim.cmd("colorscheme " .. colorscheme)

-- UI improvements
require('dressing').setup()
