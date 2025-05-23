-- LSP setup definitions

local lsp_langs = {
  "lua_ls",
  "pyright",
  "ruff",
  "ts_ls",
  "eslint",
  "tailwindcss",
  "rust_analyzer",
  "gopls"
}

require("mason").setup({
  ui = {
    border = "rounded",
  }
})

require("mason-lspconfig").setup({
  ensure_installed = lsp_langs
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local navic = require("nvim-navic")

navic.setup({
  highlight = true,
})

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end

  if client.name == 'ruff' then
    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false
  end

  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.keymap.set('n', 'F', vim.lsp.buf.format, {})
  vim.keymap.set("n", "<leader>ed", function() vim.lsp.buf.declaration() end, opts)
  vim.keymap.set("n", "<leader>gI", function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  -- format on save
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
    buffer = bufnr,
    callback = function()
      if client.supports_method("textDocument/formatting") then
        vim.lsp.buf.format()
      end
    end
  })
end

require("lspconfig")['pyright'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("lspconfig")['ruff'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("lspconfig")['eslint'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("lspconfig")['rust_analyzer'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("lspconfig")['gopls'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("lspconfig")['ts_ls'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" }
}

-- lspkind setup
local lspkind = require('lspkind')

-- luasnip setup
require("luasnip.loaders.from_vscode").lazy_load()
local luasnip = require('luasnip')

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  Preselect = cmp.PreselectMode.None, -- don't preselect
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'copilot' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'nvim_lsp_signature_help' },
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 20,
      ellipsis_char = '...',
    })
  }
}
