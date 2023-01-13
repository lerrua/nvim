local opts = { remap = false, silent = true }

vim.keymap.set('n', '<leader><space>', ':nohlsearch<CR>', opts)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

vim.keymap.set("x", "<leader>p", [["_dP]], opts)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- Set working directory
vim.keymap.set("n", "<leader>.", ":cd %:p:h<CR>:pwd<CR>", opts)

-- Tabs navigation
vim.keymap.set('n', '<Tab>', 'gt', opts)
vim.keymap.set('n', '<S-Tab>', 'gT', opts)
vim.keymap.set('n', '<S-t>', ':tabnew<CR>', opts)
vim.keymap.set('n', '<leader>z', ':tabnew %<CR>', opts)

-- Window navigation
vim.keymap.set('n', '<leader>h', ':sp<CR>', opts)
vim.keymap.set('n', '<leader>v', ':vsp<CR>', opts)

-- Buffers navigation
vim.keymap.set('n', '<BS>', ':bprevious<CR>', opts)

vim.keymap.set('n', 'q', ':q<CR>', opts)
vim.keymap.set('n', '<leader>w', ':w<CR>', opts)
