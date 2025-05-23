require'nvim-treesitter.configs'.setup {
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
