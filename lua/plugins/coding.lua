return {
  -- AI Assistants
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
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
    end,
  },
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
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "lua", "luadoc", "luap",
          "rust",
          "go", "gomod", "gosum", "gowork",
          "ruby",
          "bash",
          "css",
          "dockerfile",
          "solidity",
          "html",
          "python",
          "yaml", "query",
          "elixir",
          "json",
          "javascript",
          "markdown", "markdown_inline",
          "vim", "vimdoc",
          "vue",
          "tsx", "typescript",
          "terraform",
          "proto"
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      }
    end
  },

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

  -- Test Runners
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-python",
      "olimorris/neotest-rspec",
      "nvim-neotest/neotest-go",
    },
    config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-vitest"),
        require("neotest-python"),
        require("neotest-rspec"),
        require("neotest-go"),
        require("neotest-jest")({
          jestCommand = "yarn test --watchAll=false --passWithNoTests",
          jestConfigFile = "custom.jest.config.ts",
          env = {
            CI = true,
          },
          cwd = function()
            return vim.fn.getcwd()
          end,
        }),
      }
    })
  end,
  },
}
