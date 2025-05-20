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
  { "nvimtools/none-ls.nvim" },
  { "nvimtools/none-ls-extras.nvim" },
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig"
  },
  { "simrat39/symbols-outline.nvim" },

  -- Language-specific
  {
    "ray-x/go.nvim",
  },
  {
    "ray-x/guihua.lua", 
    build = "cd lua/fzy && make"
  },

  -- PlantUML
  {
    "https://gitlab.com/itaranto/plantuml.nvim",
    version = "*",
    config = function() require('plantuml').setup() end
  },
}