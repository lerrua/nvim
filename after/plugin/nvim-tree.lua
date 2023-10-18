vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  respect_buf_cwd = true,
  sync_root_with_cwd = true,
  view = {
    width = '30%'
  },
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = false,
      }
    },
  }
})

local opts = { remap = false, silent = true }

vim.keymap.set('n', '<F4>', ':NvimTreeFindFileToggle<CR>', opts)
