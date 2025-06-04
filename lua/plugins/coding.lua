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

  -- Rust
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
    ["rust_analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}
