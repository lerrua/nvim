return {
  -- UI Enhancements
  { "stevearc/dressing.nvim" },
  
  -- File explorers
  { "nvim-tree/nvim-tree.lua" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },
  
  -- UI Components
  { "nvim-tree/nvim-web-devicons" },
  {
    "akinsho/bufferline.nvim", 
    version = "*", 
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  { "nvim-lualine/lualine.nvim" },
  { "lukas-reineke/indent-blankline.nvim" },
  { "numToStr/Comment.nvim" },
  { "rcarriga/nvim-notify" },
  { "m4xshen/autoclose.nvim" },
  { "j-hui/fidget.nvim" },
  { 
    "akinsho/toggleterm.nvim", 
    version = "*" 
  },
  { "folke/trouble.nvim" },
  { "MeanderingProgrammer/render-markdown.nvim" },
  { "HakonHarnes/img-clip.nvim" },
  { "folke/which-key.nvim" },
  { "bassamsdata/namu.nvim" },
  { "MagicDuck/grug-far.nvim" },
  
  -- Status/Info displays
  {
    "utilyre/barbecue.nvim",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("barbecue").setup()
    end,
  },
  
  -- Notification and UI improvements
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  
  -- NVChad components
  { "nvchad/volt" },
  { "nvchad/menu" },
}