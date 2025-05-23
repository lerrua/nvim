return {
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make"
  },
  { "nvim-telescope/telescope-file-browser.nvim" },
  { "nvim-telescope/telescope-ui-select.nvim" },

  -- Search/Replace utilities
  { "nvim-pack/nvim-spectre" },

  -- File explorers
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<F4>", "<CMD>NvimTreeToggle<CR>", desc = "File Explorer" },
    },
    config = function()
      require("nvim-tree").setup(
        {
          view = {
            width = '40%',
          }
        }
      )
    end,
  },
}
