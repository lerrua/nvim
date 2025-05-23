return {
  -- AI Assistants
  { "zbirenbaum/copilot.lua" },
  {
    "yetone/avante.nvim",
    branch = "main",
    build = "make",
    config = function()
      require('avante_lib').load()
      require('avante').setup({
        provider = 'copilot',
        copilot = {
          model = "claude-3.7-sonnet",
        }
      })
    end
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end
  },
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require('claude-code').setup()
    end
  },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Comments/Notes
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  },

  -- Completion and Snippets
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp"
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
      "hrsh7th/cmp-nvim-lua",     -- LSP source for built-in LUA API
      "hrsh7th/cmp-path",         -- LSP source for filesystem paths
      "hrsh7th/cmp-buffer",       -- LSP source for buffer words
      "hrsh7th/cmp-nvim-lsp-signature-help", -- LSP source for displaying function signatures
      "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
      "rafamadriz/friendly-snippets", -- Snippets collection
      "onsails/lspkind-nvim",     -- Pictograms for LSP
    },
  },
}
