return {
  -- Git integrations
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>gbl", ":Gitsigns blame_line<CR>", desc = "Git Blame Line" },
      { "<leader>gb",  ":Gitsigns blame<CR>",      desc = "Git Blame" },
    },
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    config = function()
      require("neogit").setup()
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>lg", ":LazyGit<CR>", desc = "LazyGit" },
    },
  },
}
