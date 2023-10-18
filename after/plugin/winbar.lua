-- winbar
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

