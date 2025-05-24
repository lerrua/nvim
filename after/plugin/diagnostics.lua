-- -- signs for diagnostics
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
--
-- Configure diagnostics
vim.diagnostic.config({
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.Error,
      [vim.diagnostic.severity.WARN] = signs.Warn,
      [vim.diagnostic.severity.HINT] = signs.Hint,
      [vim.diagnostic.severity.INFO] = signs.Info,
    },
  },
})
--
-- local function custom_vim_mode()
--   local default_icon = ' '
--   local insert_mode_icon = ' '
--   local terminal_mode_icon = ' '
--
--   -- auto change status according to neovims mode
--   local mode_label = {
--     n = default_icon,
--     i = insert_mode_icon,
--     v = default_icon,
--     [''] = default_icon,
--     V = default_icon,
--     c = default_icon,
--     no = default_icon,
--     s = default_icon,
--     S = default_icon,
--     ic = default_icon,
--     R = default_icon,
--     Rv = default_icon,
--     cv = default_icon,
--     ce = default_icon,
--     r = default_icon,
--     rm = default_icon,
--     ['r?'] = default_icon,
--     ['!'] = default_icon,
--     t = terminal_mode_icon,
--   }
--
--   if mode_label[vim.fn.mode()] == nil then
--     return default_icon
--   end
--   return mode_label[vim.fn.mode()]
-- end
--
-- local function custom_filetype()
--   local filetype = vim.bo.filetype
--   if filetype == '' then
--     return 'No File'
--   end
--
--   local filetype_icon = {
--     TelescopePrompt = ' Telescope',
--     NvimTree = '󰙅 File Explorer',
--     mason = '󰏖 Mason',
--     Lazy = '󰒋 Lazy',
--     lazygit = '󰊢 LazyGit',
--     help = '󰋖 Help',
--     AvanteInput = '󱙺 Avante AI',
--     Outline = '',
--     qf = '󰅚 Quickfix',
--     diff = '󰀨 Diff',
--     git = '󰊢 Git',
--     trouble = ' Trouble',
--   }
--
--   if filetype_icon[filetype] ~= nil then
--     return filetype_icon[filetype]
--   end
--
--   -- Use webdev-icons and filetype for all other filetypes
--   local has_devicons, devicons = pcall(require, 'nvim-web-devicons')
--   if has_devicons then
--     local icon = devicons.get_icon_by_filetype(filetype)
--     if icon then
--       return icon .. ' ' .. filetype
--     end
--   end
--   return filetype
-- end
--
-- require('lualine').setup {
--   options = {
--     theme = 'catppuccin',
--     icons_enabled = true,
--     component_separators = '',
--     section_separators = { left = '', right = '' },
--     globalstatus = true,
--     symbols = {
--       error = signs.Error,
--       warn = signs.Warn,
--       info = signs.Info,
--       hint = signs.Hint,
--     },
--     colored = false
--   },
--   sections = {
--     lualine_a = { custom_vim_mode },
--     lualine_b = { '' },
--     lualine_c = { '' },
--     lualine_x = { 'diagnostics', custom_filetype },
--     lualine_y = { 'location'},
--     lualine_z = { 'diff', 'branch' },
--   }
-- }
