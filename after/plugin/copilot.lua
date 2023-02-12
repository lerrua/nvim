vim.g.copilot_filetypes = {
  TelescopePrompt = false,
}
vim.g.copilot_no_tab_map = true

vim.keymap.set("i", "<C-a>", "copilot#Accept()",
  { script = true, expr = true, remap = false, silent = true, replace_keycodes = false })
vim.keymap.set("i", "<C-x>", "copilot#Dismiss()", { script = true, expr = true, remap = false, silent = true })
