return {
  -- AI Assistants
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      "saghen/blink.cmp",
    },
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<C-a>",
            accept_line = "<C-l>",
            accept_word = "<C-w>",
            prev = "<C-p>",
            next = "<C-n>",
            dismiss = "<C-d>",
          },
        },
        auto_refresh = true,
        panel = { enabled = true },
        server_opts_overrides = {
          trace = "verbose",
          settings = {
            advanced = {
              listCount = 10,
              inlineSuggestCount = 3,
            },
          },
        },
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "BlinkCmpMenuOpen",
        callback = function()
          vim.b.copilot_suggestion_hidden = true
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "BlinkCmpMenuClose",
        callback = function()
          vim.b.copilot_suggestion_hidden = false
        end,
      })
    end,
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("avante_lib").load()
      require("avante").setup({
        provider = "copilot",
        copilot = {
          model = "claude-3.7-sonnet",
        },
      })
    end,
  },
}
