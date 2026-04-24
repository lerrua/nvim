return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    tag = "v1.11.0",
    config = function()
      require("catppuccin").setup {
        default_integrations = true,
        integrations = {
          cmp = true,
          blink_cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = true,
          fidget = true,
          fzf = true,
          copilot_vim = true,
          lsp_trouble = true,
          which_key = true,
          telescope = true,
        },
        flavour = "auto", -- latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "macchiato",
        },
        styles = {
          comments = { "italic" },
          strings = { "italic" },
          conditionals = { "italic" },
          loops = { "italic" },
          keywords = { "italic" },
          types = { "italic" },
        },
      }
      -- vim.cmd.colorscheme "catppuccin-macchiato"
    end,
  },
  {
    "e-ink-colorscheme/e-ink.nvim",
    priority = 1000,
    config = function()
      require("e-ink").setup()
      vim.opt.background = "light"
      vim.cmd.colorscheme "e-ink"
    end,
  },
}
