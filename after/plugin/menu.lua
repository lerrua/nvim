-- Keyboard users
vim.keymap.set("n", "<C-c>", function()
  require("menu").open("default")
end, {})

-- mouse users + nvimtree users
vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})
