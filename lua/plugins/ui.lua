-- UI Components

-- signs for diagnostics
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

-- status mode
local function custom_vim_mode()
  local default_icon = ' '
  local insert_mode_icon = ' '
  local terminal_mode_icon = ' '

  -- auto change status according to neovims mode
  local mode_label = {
    n = default_icon,
    i = insert_mode_icon,
    v = default_icon,
    [''] = default_icon,
    V = default_icon,
    c = default_icon,
    no = default_icon,
    s = default_icon,
    S = default_icon,
    ic = default_icon,
    R = default_icon,
    Rv = default_icon,
    cv = default_icon,
    ce = default_icon,
    r = default_icon,
    rm = default_icon,
    ['r?'] = default_icon,
    ['!'] = default_icon,
    t = terminal_mode_icon,
  }

  if mode_label[vim.fn.mode()] == nil then
    return default_icon
  end
  return mode_label[vim.fn.mode()]
end

-- status filetype
local function custom_filetype()
  local filetype = vim.bo.filetype
  if filetype == '' then
    return 'No File'
  end

  local filetype_icon = {
    TelescopePrompt = ' Telescope',
    NvimTree = '󰙅 File Explorer',
    mason = '󰏖 Mason',
    Lazy = '󰒋 Lazy',
    lazygit = '󰊢 LazyGit',
    help = '󰋖 Help',
    AvanteInput = '󱙺 Avante AI',
    Outline = '',
    qf = '󰅚 Quickfix',
    diff = '󰀨 Diff',
    git = '󰊢 Git',
    trouble = ' Trouble',
  }

  if filetype_icon[filetype] ~= nil then
    return filetype_icon[filetype]
  end

  -- Use webdev-icons and filetype for all other filetypes
  local has_devicons, devicons = pcall(require, 'nvim-web-devicons')
  if has_devicons then
    local icon = devicons.get_icon_by_filetype(filetype)
    if icon then
      return icon .. ' ' .. filetype
    end
  end
  return filetype
end

return {
  -- UI Enhancements
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup()
    end,
  },

  -- Web Icons
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        override = {
          rb = {
            icon = "",
            color = "#FF8080",
            name = "Rb"
          },
        },
        default = true;
      })
    end,
  },

  -- Tabs UI
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
              text = "󰙅 File Explorer",
              highlight = "Directory",
              separator = false,
            }
          }
        }
      })
    end,
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    after = "catppuccin",
    config = function()
      require('lualine').setup {
        options = {
          theme = 'catppuccin',
          icons_enabled = true,
          component_separators = '',
          section_separators = { left = '', right = '' },
          globalstatus = true,
          symbols = {
            error = signs.Error,
            warn = signs.Warn,
            info = signs.Info,
            hint = signs.Hint,
          },
          colored = false
        },
        sections = {
          lualine_a = { custom_vim_mode },
          lualine_b = { '' },
          lualine_c = { '' },
          lualine_x = { 'diagnostics', custom_filetype },
          lualine_y = { 'location'},
          lualine_z = { 'diff', 'branch' },
        }
      }
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup()
    end,
  },

  -- Loading UI
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

  -- Diagnostics
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

  -- Winbar breadcrumbs
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

  -- Right click menu
  { "nvzone/volt" },
  {
    "nvzone/menu",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- keyboard users
      vim.keymap.set("n", "<C-c>", function()
        require("menu").open("default")
      end, {})

      -- mouse users + nvimtree users
      vim.keymap.set("n", "<RightMouse>", function()
        vim.cmd.exec '"normal! \\<RightMouse>"'

        local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
        require("menu").open(options, { mouse = true })
      end, {})
    end
  },
}
