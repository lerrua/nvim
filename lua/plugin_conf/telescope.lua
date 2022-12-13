require('telescope').setup(
  {
    pickers = {
      find_files = {
        theme = "dropdown",
      }
    },
  }
)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>e', builtin.find_files, {})
vim.keymap.set('n', '<space><space>', builtin.oldfiles, {})
vim.keymap.set('n', '<space>f', builtin.live_grep, {})
vim.keymap.set('n', '<space>b', builtin.buffers, {})
vim.keymap.set('n', '<space>fh', builtin.help_tags, {})
