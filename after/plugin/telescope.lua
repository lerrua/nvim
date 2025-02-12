require('telescope').setup(
  {
    defaults = {
      prompt_prefix = '  ',
      file_ignore_patterns = { "%.git/", "node_modules/", "dist/" },
      border = true,
      borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    },
    layout_strategy = "center",
    pickers = {
      find_files = { previewer = false, hidden = true },
      live_grep = { additional_args = function() return { "--hidden" } end },
      buffers = { previewer = false },
    },
    extensions = {
      file_browser = {
        hidden = true,
        respect_gitignore = false,
        previewer = false,
      },
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  }
)
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
require("telescope").load_extension("noice")
require("telescope").load_extension("ui-select")

-- keymaps
local opts = { remap = false, silent = true }
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<space>e', builtin.find_files, {})
vim.keymap.set('n', '<space><space>', builtin.oldfiles, {})
vim.keymap.set('n', '<space>f', builtin.live_grep, {})
vim.keymap.set('n', '<space>fg', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<space>b', builtin.buffers, {})
vim.keymap.set('n', '<space>t', builtin.help_tags, {})
vim.keymap.set("n", "<F3>", ":Telescope file_browser<CR>", opts)
vim.keymap.set("n", "<space>g", require("telescope.builtin").git_status, { desc = "Search [G]it modified files" })

-- borderless theme
local TelescopePrompt = {
    TelescopePromptNormal = {
        bg = '#2d3149',
    },
    TelescopePromptBorder = {
        bg = '#2d3149',
    },
    TelescopePromptTitle = {
        fg = '#2d3149',
        bg = '#2d3149',
    },
    TelescopePreviewTitle = {
        fg = '#1F2335',
        bg = '#1F2335',
    },
    TelescopeResultsTitle = {
        fg = '#1F2335',
        bg = '#1F2335',
    },
    TelescopeBorder = { bg = "none" },
    TelescopeNormal = { bg = "none" },
}
for hl, col in pairs(TelescopePrompt) do
    vim.api.nvim_set_hl(0, hl, col)
end
