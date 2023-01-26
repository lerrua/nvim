local function custom_vim_mode()
  local default_icon = ' '
  local insert_mode_icon = ' '
  local terminal_mode_icon = ' '

  -- auto change status according to neovims mode
  local mode_label = {
    n = default_icon,
    i = insert_mode_icon,
    v = default_icon,
    [''] = default_icon,
    V = default_icon,
    c = default_icon,
    no = default_icon,
    s = default_icon,
    S = default_icon,
    ic = default_icon,
    R = default_icon,
    Rv = default_icon,
    cv = default_icon,
    ce = default_icon,
    r = default_icon,
    rm = default_icon,
    ['r?'] = default_icon,
    ['!'] = default_icon,
    t = terminal_mode_icon,
  }

  if mode_label[vim.fn.mode()] == nil then
    return default_icon
  end
  return mode_label[vim.fn.mode()]
end

local function custom_lsp_navic_output()
  local navic = require("nvim-navic")
  local navic_message = ''

  if navic.is_available() then
    navic_message = " %t > %{%v:lua.require'nvim-navic'.get_location()%}"
  end
  return navic_message
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    component_separators = '',
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = { custom_vim_mode },
    lualine_b = { 'branch' },
    lualine_c = {},
    lualine_x = { 'diff', 'diagnostics' },
    lualine_y = {},
  }
}
