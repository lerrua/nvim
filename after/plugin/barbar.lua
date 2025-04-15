-- Set barbar's options
-- require 'bufferline'.setup {
--   auto_hide = false,
-- }
--

-- require('tabby.tabline').use_preset('active_wins_at_tail', {
--   theme = {
--     fill = 'TabLineFill', -- tabline background
--     head = 'TabLine', -- head element highlight
--     current_tab = 'TabLineSel', -- current tab label highlight
--     tab = 'TabLine', -- other tab label highlight
--     win = 'TabLine', -- window highlight
--     tail = 'TabLine', -- tail element highlight
--   },
--   nerdfont = true, -- whether use nerdfont
--   tab_name = {
--       name_fallback = 'function({tabid}), return a string',
--   },
--   buf_name = {
--       mode = "'unique'|'relative'|'tail'|'shorten'",
--   },
-- })
require("bufferline").setup({
  options = {
    offsets = {
        {
            filetype = "NvimTree",
            text = "",
            highlight = "Directory",
            separator = false,
        }
    }
  }
})
