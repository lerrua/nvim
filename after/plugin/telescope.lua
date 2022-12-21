require('telescope').setup(
  {
    pickers = {
      find_files = { theme = "dropdown", previewer = false },
      live_grep = { theme = "dropdown" },
      buffers = { theme = "dropdown", previewer = false },
    },
  }
)
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>e', builtin.find_files, {})
vim.keymap.set('n', '<space><space>', builtin.oldfiles, {})
vim.keymap.set('n', '<space>f', builtin.live_grep, {})
vim.keymap.set('n', '<space>fg', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<space>b', builtin.buffers, {})
vim.keymap.set('n', '<space>t', builtin.help_tags, {})
vim.api.nvim_set_keymap("n", "<F3>", ":Telescope file_browser<CR>", { noremap = true })
