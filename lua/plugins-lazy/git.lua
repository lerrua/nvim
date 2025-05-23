return {
  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>gb", ":Gitsigns blame_line<CR>", desc = "Git Blame" },
    },
    config = function()
      require('gitsigns').setup()
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim"
    },
    config = function()
      require('neogit').setup()
    end,
  },
  {
    "iberianpig/tig-explorer.vim",
    dependencies = { "rbgrouleff/bclose.vim" }
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
