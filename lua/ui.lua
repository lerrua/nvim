require("utils")

vim.t_Co = 256
vim.opt.termguicolors = true

-- winbar
local winbar_highlight = 'TabLineSel'
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function()
    -- skip if a pop up window
    if vim.fn.win_gettype() == 'popup' then
      return
    end

    -- skip if new buffer
    if vim.bo.filetype == '' then
      return
    end

    -- get the current folder and file name
    local file_path = vim.api.nvim_eval_statusline('%F', {}).str
    if file_path == nil then
      return
    end

    file_path = file_path:split('/')
    table.remove(file_path, #file_path)

    local path = file_path[#file_path]
    if path == nil then
      return
    end

    local separator = ' > '
    vim.wo.winbar = '▎ ' .. path .. separator .. ' ' ..
        '%t' .. separator .. "%{%v:lua.require'nvim-navic'.get_location()%}"
  end,
})

require('rose-pine').setup({
  dark_variant = 'moon',
  highlight_groups = {
    Character = { fg = 'foam' },
    String = { fg = 'iris' },
    TSParameter = { fg = 'iris' },
    TSProperty = { fg = 'iris' },
    TSVariable = { fg = 'text' },
    WinBar = { link = winbar_highlight },
    ['@parameter'] = { fg = 'iris', italic = false },
    ['@property'] = { fg = 'iris', italic = false },
    ['@text.emphasis'] = { italic = false },
    ['@variable'] = { fg = 'text', italic = false, bold = true },
  }
})

local hr = tonumber(os.date('%H', os.time()))
if hr > 6 and hr < 18 then -- local time between 6AM and 6PM
  vim.opt.background = "light"
else
  vim.opt.background = "dark"
end
vim.cmd("colorscheme rose-pine")

-- UI improvements
require('dressing').setup()
