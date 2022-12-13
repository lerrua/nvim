require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "rust", "go", "ruby", "bash", "css", "dockerfile", "solidity", "html", "python",
                       "elixir", "json", "javascript", "markdown", "vim", "vue", "tsx", "typescript" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    use_languagetree = true,
  },
}
