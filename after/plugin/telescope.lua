require('telescope').setup(
  {
    defaults = {
      prompt_prefix = ' 🔍 ',
      file_ignore_patterns = { "%.git/", "node_modules/", "dist/" },
    },
    pickers = {
      find_files = { theme = "dropdown", previewer = false, hidden = true },
      live_grep = { theme = "dropdown", additional_args = function() return { "--hidden" } end },
      buffers = { theme = "dropdown", previewer = false },
    },
    extensions = {
      file_browser = {
        hidden = true,
        respect_gitignore = false,
      },
    },
  }
)
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

-- keymaps
local opts = { remap = false, silent = true }
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<space>e', builtin.find_files, {})
vim.keymap.set('n', '<space><space>', builtin.oldfiles, {})
vim.keymap.set('n', '<space>f', builtin.live_grep, {})
vim.keymap.set('n', '<space>fg', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<space>b', builtin.buffers, {})
vim.keymap.set('n', '<space>t', builtin.help_tags, {})
vim.keymap.set("n", "<F3>", ":Telescope file_browser<CR>", opts)
vim.keymap.set("n", "<space>g", require("telescope.builtin").git_status, { desc = "Search [G]it modified files" })
