local map = vim.keymap.set
local opts = { remap = false, silent = true }

map("n", "<leader><space>", "<CMD>nohlsearch<CR>", opts)

map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

map("x", "<leader>p", [["_dP]], opts)
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- Map <leader>i to re-indent the entire file
map("n", "<leader>i", "gg=G", opts)

-- Map <leader>bi to re-indent the current block
map("v", "<leader>bi", "=", opts)

-- Set working directory
map("n", "<leader>.", "<>cd %:p:h<CR>:pwd<CR>", opts)

-- Tabs navigation
map("n", "<Tab>", "gt", opts)
map("n", "<S-Tab>", "gT", opts)
map("n", "<S-t>", "<CMD>tabnew<CR>", opts)
map("n", "<leader>z", "<CMD>tabnew %<CR>", opts)

-- Window navigation
map("n", "<leader>h", "<CMD>sp<CR>", opts)
map("n", "<leader>v", "<CMD>vsp<CR>", opts)

-- Buffers navigation
map("n", "<S-BS>", "<CMD>bprevious<CR>", opts)

map("n", "q", "<CMD>q<CR>", opts)
map("n", "<leader>w", "<CMD>write<CR>", opts)

-- Replace inside word
map("n", "<CR>", "ciw", opts)

-- Force all buffers reload
map("n", "<F5>", "<CMD>bufdo e<CR>", opts)

-- Open terminal in vertical split and enter insert mode
map("n", "<leader>tv", "<CMD>vsp | term<CR>i", opts)

-- Toggle light/dark mode
map("n", "<leader>td", function()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end, opts)
