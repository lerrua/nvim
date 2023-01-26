vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  respect_buf_cwd = true,
  sync_root_with_cwd = true,
})

local opts = { remap = false, silent = true }

vim.keymap.set('n', '<F4>', ':NvimTreeFindFileToggle<CR>', opts)
