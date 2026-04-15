return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("avante_lib").load()
      require("avante").setup({
        provider = "copilot",
        providers = {
          copilot = {
            model = "claude-4-sonnet",
          },
        },
      })
    end,
  },
}
