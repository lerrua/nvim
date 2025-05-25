return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup {
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = true,
          fidget = true,
          fzf = true,
          copilot_vim = false,
          lsp_trouble = false,
          which_key = false,
        },
        flavour = "frappe", -- latte, frappe, macchiato, mocha
        styles = {
          comments = { "italic" },
          strings = { "italic" },
          conditionals = { "italic" },
        },
      }
      vim.cmd.colorscheme "catppuccin-frappe"
    end,
  },
}
