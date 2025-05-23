return {
  -- UI Enhancements
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup()
    end,
  },

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
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        -- override = {
        --   py = {
        --     icon = "",
        --     color = "#428850",
        --     cterm_color = "65",
        --     name = "Py"
        --   }
        -- },
        -- default = true,
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    after="catppuccin",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        highlights = require("catppuccin.groups.integrations.bufferline").get(),
        options = {
          color_icons = false,
          separator_style = "slant",
          diagnostics = "nvim_lsp",
          offsets = {
            {
              filetype = "NvimTree",
              text = "",
              highlight = "Directory",
              separator = false,
            }
          }
        }
      })
    end,
  },
  { "nvim-lualine/lualine.nvim" },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup()
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        render = "minimal",
        stages = "static",
        timeout = 2000,
        top_down = false,
      })
    end,
  },
  {
    "m4xshen/autoclose.nvim",
    config = function()
      require("autoclose").setup({
        options = {
          disable_when_touch = true,
          disable_filetype = { "TelescopePrompt", "vim" },
        }
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({
        -- text = {
        --   spinner = "dots_negative",
        -- }
      })
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require('toggleterm').setup({
        shade_terminals = false,
        direction = "float",
        size = 20,
        float_opts = {
          border = "rounded",
        },
    })
    end,
  },
  {
    "folke/trouble.nvim",
    keys = {
      { "<F9>", "<CMD>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup()
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    config = function()
      require("render-markdown").setup()
    end,
  },
  {
    "HakonHarnes/img-clip.nvim",
    config = function()
      require("img-clip").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end,
  },
  {
    "bassamsdata/namu.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("namu").setup()
    end,
  },
  {
    "MagicDuck/grug-far.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("grug-far").setup()
    end,
  },

  -- Status/Info displays
  {
    "utilyre/barbecue.nvim",
    after = "catppuccin",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("barbecue").setup({
        theme = "catppuccin",
      })
    end,
  },

  -- Notification and UI improvements
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
      })
    end,
  },

  -- NVChad components
  { "nvchad/volt" },
  { "nvchad/menu" },
}
