require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "sumneko_lua", "solargraph", "pyright", "tsserver" }
})

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

require("lspconfig")['sumneko_lua'].setup {
  on_attach = on_attach,
}

require("lspconfig")['solargraph'].setup {
  on_attach = on_attach
}

require("lspconfig")['pyright'].setup {
  on_attach = on_attach
}

require("lspconfig")['tsserver'].setup {
  on_attach = on_attach,
  filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" }
}
