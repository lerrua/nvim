return {
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<space>e",       "<CMD>Telescope find_files<CR>",         desc = "Find Files" },
      { "<space><space>", "<CMD>Telescope oldfiles<CR>",           desc = "Old Files" },
      { "<space>f",       "<CMD>Telescope live_grep<CR>",          desc = "Live Grep" },
      { "<space>fg",      "<CMD>Telescope grep_string<CR>",        desc = "Grep String" },
      { "<space>b",       "<CMD>Telescope buffers<CR>",            desc = "Buffers" },
      { "<space>t",       "<CMD>Telescope help_tags<CR>",          desc = "Help Tags" },
      { "<F3>",           "<CMD>Telescope file_browser<CR>",       desc = "File Browser" },
      { "<space>g",       require("telescope.builtin").git_status, desc = "Search [G]it modified files" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          prompt_title = false,
          results_title = false,
          prompt_prefix = "  ",
          selection_caret = " ",
          file_ignore_patterns = { "%.git/", "node_modules/", "dist/" },
          border = {},
          use_less = true,
          vimgrep_arguments = {
            "rg",
            "--vimgrep",
            "--hidden",
            "--smart-case",
            "--trim",
          },
        },
        layout_strategy = "center",
        pickers = {
          find_files = { previewer = false, hidden = true },
          buffers = { previewer = false },
        },
        extensions = {
          file_browser = {
            hidden = true,
            respect_gitignore = false,
            previewer = false,
          },
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")
      require("telescope").load_extension("noice")
      require("telescope").load_extension("ui-select")

      -- borderless theme
      -- local TelescopePrompts = {
      -- TelescopePromptNormal = {
      --   bg = '#2d3149',
      -- },
      -- TelescopePromptBorder = {
      --   bg = '#2d3149',
      -- },
      -- NormalFloat = { bg = '#2d3149' },
      -- FloatBorder = { bg = '#2d3149', fg = '#2d3149' },
      -- TelescopePromptTitle = {
      --   -- fg = '#2d3149',
      --   bg = '#2d3149',
      -- },
      -- TelescopePreviewTitle = {
      --   -- fg = '#1F2335',
      --   bg = '#1F2335',
      -- },
      -- TelescopeResultsTitle = {
      --   -- fg = '#1F2335',
      --   bg = '#1F2335',
      -- },
      -- TelescopeBorder = { bg = "none" },
      -- TelescopeNormal = { bg = "none" },
      -- }
      -- for hl, col in pairs(TelescopePrompts) do
      --   vim.api.nvim_set_hl(0, hl, col)
      -- end
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  { "nvim-telescope/telescope-file-browser.nvim" },
  { "nvim-telescope/telescope-ui-select.nvim" },

  -- Search/Replace utilities
  {
    "nvim-pack/nvim-spectre",
    keys = {
      { "<leader>S", "<cmd>lua require('spectre').toggle()<CR>", desc = "Toggle Spectre" },
      {
        "<leader>Sw",
        "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
        desc = "Search current word",
      },
      {
        "<leader>Sp",
        "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
        desc = "Search on current file",
      },
    },
  },
  {
    "MagicDuck/grug-far.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>f", "<CMD>GrugFar<CR>", desc = "Find Files with Grug Far" },
    },
    config = function()
      require("grug-far").setup()
    end,
  },

  -- File explorers
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<F4>", "<CMD>NvimTreeFindFileToggle<CR>", desc = "File Explorer" },
    },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = "40%",
        },
      })
    end,
  },
}
