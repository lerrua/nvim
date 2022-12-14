local lsp_langs = {
  "sumneko_lua",
  "solargraph",
  "pyright",
  "tsserver",
  "eslint",
  "rust_analyzer",
  "gopls"
}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = lsp_langs
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

  vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, {})
end

require("lspconfig")['sumneko_lua'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("lspconfig")['solargraph'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("lspconfig")['pyright'].setup {
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

require("lspconfig")['tsserver'].setup {
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
