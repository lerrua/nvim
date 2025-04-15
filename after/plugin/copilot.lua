-- vim.g.copilot_filetypes = {
--   TelescopePrompt = false,
-- }
-- vim.g.copilot_no_tab_map = true
-- vim.g.enabled = false
--
-- vim.keymap.set("i", "<C-a>", "copilot#Accept()",
--   { script = true, expr = true, remap = false, silent = true, replace_keycodes = false })
-- vim.keymap.set("i", "<C-x>", "copilot#Dismiss()", { script = true, expr = true, remap = false, silent = true })

-- require("CopilotChat").setup({
--   model = 'claude-3.5-sonnet',
--   question_header = '  ',
--   answer_header = '  ',
-- })
--
-- vim.api.nvim_create_autocmd('BufEnter', {
--   group = vim.api.nvim_create_augroup('CopilotChat', { clear = true }),
--   pattern = 'copilot-*',
--   callback = function()
--     vim.opt_local.relativenumber = false
--     vim.opt_local.number = false
--   end,
-- })

require('img-clip').setup({})
require('render-markdown').setup({})
require("copilot").setup({
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<C-a>",
      dismiss = "<M-l>",
    }
  },
  panel = { enabled = false },
})

-- require("copilot").setup({
--   suggestion = { enabled = false },
--   panel = { enabled = false },
-- })
