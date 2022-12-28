-- tags list
require('aerial').setup()

vim.api.nvim_set_keymap("n", "<F10>", ":AerialToggle<CR>", { noremap = true })
