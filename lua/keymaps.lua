local opts = { remap = false, silent = true }

vim.keymap.set('n', '<leader><space>', '<CMD>nohlsearch<CR>', opts)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

vim.keymap.set("x", "<leader>p", [["_dP]], opts)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- Map <leader>i to re-indent the entire file
vim.keymap.set('n', '<leader>i', 'gg=G', opts)

-- Map <leader>bi to re-indent the current block
vim.keymap.set('v', '<leader>bi', '=', opts)

-- Set working directory
vim.keymap.set("n", "<leader>.", "<>cd %:p:h<CR>:pwd<CR>", opts)

-- Tabs navigation
vim.keymap.set('n', '<Tab>', 'gt', opts)
vim.keymap.set('n', '<S-Tab>', 'gT', opts)
vim.keymap.set('n', '<S-t>', '<CMD>tabnew<CR>', opts)
vim.keymap.set('n', '<leader>z', '<CMD>tabnew %<CR>', opts)

-- Window navigation
vim.keymap.set('n', '<leader>h', '<CMD>sp<CR>', opts)
vim.keymap.set('n', '<leader>v', '<CMD>vsp<CR>', opts)

-- Buffers navigation
vim.keymap.set('n', '<S-BS>', '<CMD>bprevious<CR>', opts)

vim.keymap.set('n', 'q', '<CMD>q<CR>', opts)
vim.keymap.set('n', '<leader>w', '<CMD>write<CR>', opts)

-- Replace inside word
vim.keymap.set('n', '<CR>', 'ciw', opts)

-- Spectre
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
  desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>Sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word"
})
vim.keymap.set('v', '<leader>Sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word"
})
vim.keymap.set('n', '<leader>Sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file"
})
