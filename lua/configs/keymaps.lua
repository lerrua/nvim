local map = vim.keymap.set

map("n", "<leader><space>", "<CMD>nohlsearch<CR>", { desc = "Clear search highlights" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

map("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting register" })

map("n", "<leader>i", "gg=G", { desc = "Re-indent entire file" })
map("v", "<leader>bi", "=", { desc = "Re-indent current block" })

-- Set working directory
map("n", "<leader>.", "<CMD>cd %:p:h<CR>:pwd<CR>", { desc = "Set working directory to current file's directory" })

-- Tabs navigation
map("n", "<Tab>", "gt", { desc = "Go to next tab" })
map("n", "<S-Tab>", "gT", { desc = "Go to previous tab" })
map("n", "<S-t>", "<CMD>tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>z", "<CMD>tabnew %<CR>", { desc = "Open current file in new tab" })

-- Window navigation
map("n", "<leader>h", "<CMD>sp<CR>", { desc = "Split window horizontally" })
map("n", "<leader>v", "<CMD>vsp<CR>", { desc = "Split window vertically" })

-- Buffers navigation
map("n", "<S-BS>", "<CMD>bprevious<CR>", { desc = "Go to previous buffer" })

map("n", "q", "<CMD>q<CR>", { desc = "Quit current window" })
map("n", "<leader>w", "<CMD>write<CR>", { desc = "Save current file" })

-- Replace inside word
map("n", "<CR>", "ciw", { desc = "Replace word under cursor" })

-- Force all buffers reload
map("n", "<F5>", "<CMD>bufdo e<CR>", { desc = "Force reload all buffers" })

-- Open terminal in vertical split and enter insert mode
map("n", "<leader>tv", "<CMD>vsp | term<CR>i", { desc = "Open terminal in vertical split" })

-- Toggle light/dark mode
map("n", "<leader>td", function()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end, { desc = "Toggle light/dark mode" })
