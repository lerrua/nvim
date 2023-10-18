require("utils")

vim.t_Co = 256
vim.opt.termguicolors = true

local hr = tonumber(os.date('%H', os.time()))
local colorscheme = 'catppuccin-frappe'
-- local colorscheme = 'catppuccin-latte'
if hr > 18 or hr < 6 then -- dark mode on local time between 6PM and 6AM
  colorscheme = 'catppuccin'
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

-- local rose_bones_winbar = 'TabLineSel'
-- require('rose-pine').setup({
--   dark_variant = 'moon',
--   highlight_groups = {
--     Character = { fg = 'foam' },
--     String = { fg = 'iris' },
--     TSParameter = { fg = 'iris' },
--     TSProperty = { fg = 'iris' },
--     TSVariable = { fg = 'text' },
--     DiagnosticVirtualTextError = { fg = 'love', bg = 'overlay' },
--     DiagnosticVirtualTextHint = { fg = 'iris', bg = 'overlay' },
--     DiagnosticVirtualTextInfo = { fg = 'foam', bg = 'overlay' },
--     DiagnosticVirtualTextWarn = { fg = 'gold', bg = 'overlay' },
--     WinBar = { link = rose_bones_winbar, italic = true },
--     ['@parameter'] = { fg = 'iris', italic = false },
--     ['@property'] = { fg = 'iris', italic = false },
--     ['@text.emphasis'] = { italic = false },
--     ['@variable'] = { fg = 'text', italic = false, bold = true },
--   }
-- })

vim.cmd("colorscheme " .. colorscheme)

-- UI improvements
require('dressing').setup()
