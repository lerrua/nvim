require('gitsigns').setup()
require('neogit').setup()

-- git blame toggle window
vim.keymap.set('n', '<leader>gb', ':Gitsigns blame_line<CR>')

-- setup mapping to call :LazyGit
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>')
