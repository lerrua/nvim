-- Formatters and Linters
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "jayp0521/mason-null-ls.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local null_ls = require("null-ls")

    require("mason-null-ls").setup({
      -- list of formatters & linters for mason to install
      ensure_installed = {
        "stylua",
        "ruff",
        "prettier",
        "eslint_d",
        "shfmt",
        "gofmt",
        "goimports",
      },
      automatic_installation = true,
    })

    null_ls.setup({
      sources = {
        -- formatters
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.prettier.with({
          extra_filetypes = { "astro" },
        }),
        null_ls.builtins.formatting.shfmt,
        require("none-ls.formatting.ruff").with({
          extra_args = { "--extend-select", "I" },
        }),
        require("none-ls.formatting.ruff_format"),
        -- linters
        require("none-ls.diagnostics.eslint"),
        require("none-ls.diagnostics.ruff"),
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })
  end,

  -- Diagnostics
  {
    "folke/trouble.nvim",
    keys = {
      { "<F9>", "<CMD>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
    },
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup()
    end,
  },
}
