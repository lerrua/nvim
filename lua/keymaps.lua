vim.keymap.set('n', '<leader><space>', ':nohlsearch<CR>')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Set working directory
vim.keymap.set("n", "<leader>.", ":cd %:p:h<CR>:pwd<CR>")

-- Tabs navigation
vim.keymap.set('n', '<Tab>', 'gt')
vim.keymap.set('n', '<S-Tab>', 'gT')
vim.keymap.set('n', '<S-t>', ':tabnew<CR>')
vim.keymap.set('n', '<leader>z', ':tabnew %<CR>')

-- Buffers navigation
vim.keymap.set('n', '<BS>', ':bprevious<CR>')

vim.keymap.set('n', 'q', ':q<CR>')
vim.keymap.set('n', '<leader>w', ':w<CR>')
