return {
  -- LSP
  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.gofmt,
          null_ls.builtins.formatting.goimports,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
          require("none-ls.diagnostics.eslint"),
        },
      })
    end
  },
  {
    "nvimtools/none-ls-extras.nvim",
    dependencies = { "nvimtools/none-ls.nvim" },
  },
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig"
  },
  {
    "hedyhli/outline.nvim",
    config = function()
      vim.keymap.set("n", "<F10>", "<cmd>Outline<CR>",
        { desc = "Toggle Outline" })

      require("outline").setup {}
    end,
  },

  -- Language-specific
  {
    "ray-x/go.nvim",
    dependencies = { "ray-x/guihua.lua" },
    config = function()
      require("go").setup()
    end
  },
  {
    "ray-x/guihua.lua",
    build = "cd lua/fzy && make"
  },
}
