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
        providers = {
          copilot = {
            model = "claude-4-sonnet",
          },
        },
      })
    end,
  },
}
