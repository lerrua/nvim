return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "lua",
          "luadoc",
          "luap",
          "rust",
          "go",
          "gomod",
          "gosum",
          "gowork",
          "ruby",
          "bash",
          "css",
          "dockerfile",
          "solidity",
          "html",
          "python",
          "yaml",
          "query",
          "elixir",
          "json",
          "javascript",
          "markdown",
          "markdown_inline",
          "vim",
          "vimdoc",
          "vue",
          "tsx",
          "typescript",
          "terraform",
          "proto",
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
    end,
  },

  -- Comments/Notes
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "m4xshen/autoclose.nvim",
    config = function()
      require("autoclose").setup({
        options = {
          disable_when_touch = true,
          disable_filetype = { "TelescopePrompt", "vim" },
        },
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
  },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
  },

  -- symbols outline
  {
    "hedyhli/outline.nvim",
    config = function()
      vim.keymap.set("n", "<F10>", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

      require("outline").setup {}
    end,
  },

  -- Language-specific
  -- Go
  {
    "ray-x/go.nvim",
    dependencies = { "ray-x/guihua.lua" },
    config = function()
      require("go").setup()
    end,
  },
  {
    "ray-x/guihua.lua",
    build = "cd lua/fzy && make",
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
        },
      })
    end,
  },
}
