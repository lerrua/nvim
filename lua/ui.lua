require("utils")

vim.t_Co = 256
vim.opt.termguicolors = true

-- winbar
local rose_bones_winbar = 'TabLineSel'
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

    -- get the file icon
    local bufnr = vim.api.nvim_get_current_buf()
    local file_type = vim.fn.getbufvar(bufnr, '&filetype')
    local icon = require('nvim-web-devicons').get_icon_by_filetype(file_type)

    -- set the winbar
    local separator = ' > '
    vim.wo.winbar = '▎ ' .. path .. separator .. icon .. ' ' ..
        '%t' .. separator .. "%{%v:lua.require'nvim-navic'.get_location()%}"
  end,
})

local hr = tonumber(os.date('%H', os.time()))
local colorscheme = 'catppuccin-frappe'
if hr > 18 or hr < 6 then -- dark mode on local time between 6PM and 6AM
  colorscheme = 'catppuccin'
end

require("catppuccin").setup {
  custom_highlights = function(colors)
    return {
      WinBar = { fg = colors.rosewater, bg = colors.mantle, style = { 'italic' } },
    }
  end
}

require('rose-pine').setup({
  dark_variant = 'moon',
  highlight_groups = {
    Character = { fg = 'foam' },
    String = { fg = 'iris' },
    TSParameter = { fg = 'iris' },
    TSProperty = { fg = 'iris' },
    TSVariable = { fg = 'text' },
    DiagnosticVirtualTextError = { fg = 'love', bg = 'overlay' },
    DiagnosticVirtualTextHint = { fg = 'iris', bg = 'overlay' },
    DiagnosticVirtualTextInfo = { fg = 'foam', bg = 'overlay' },
    DiagnosticVirtualTextWarn = { fg = 'gold', bg = 'overlay' },
    WinBar = { link = rose_bones_winbar },
    ['@parameter'] = { fg = 'iris', italic = false },
    ['@property'] = { fg = 'iris', italic = false },
    ['@text.emphasis'] = { italic = false },
    ['@variable'] = { fg = 'text', italic = false, bold = true },
  }
})

vim.cmd("colorscheme " .. colorscheme)

-- UI improvements
require('dressing').setup()
