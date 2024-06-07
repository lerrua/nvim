local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- colorschemes
  use {
    "mcchrish/zenbones.nvim",
    requires = "rktjmp/lush.nvim"
  }
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "ronisbr/nano-theme.nvim" }

  use 'stevearc/dressing.nvim'

  use 'nvim-tree/nvim-tree.lua'
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  use 'nvim-tree/nvim-web-devicons'
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'numToStr/Comment.nvim'
  use 'rcarriga/nvim-notify'
  use 'm4xshen/autoclose.nvim'
  use 'j-hui/fidget.nvim'
  use { 'akinsho/toggleterm.nvim', tag = '*' }
  use {"folke/trouble.nvim", branch = "dev"}
  use 'github/copilot.vim'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  }

  use({
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  })

  -- use 'nvim-pack/nvim-spectre'

  -- GIT
  use 'lewis6991/gitsigns.nvim'
  use {
    'NeogitOrg/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      "sindrets/diffview.nvim"
    }
  }
  use {
    'iberianpig/tig-explorer.vim',
    requires = { 'rbgrouleff/bclose.vim' }
  }

  -- Completion and Snippets
  use({ "L3MON4D3/LuaSnip", tag = "v2.*", run = "make install_jsregexp" })
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
      "hrsh7th/cmp-nvim-lua", -- LSP source for built-in LUA API
      "hrsh7th/cmp-path", -- LSP source for filesystem paths
      "hrsh7th/cmp-buffer", -- LSP source for buffer words
      "hrsh7th/cmp-nvim-lsp-signature-help", -- LSP source for displaying function signatures
      "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
      "rafamadriz/friendly-snippets", -- Snippets collection
      "onsails/lspkind-nvim", -- Pictograms for LSP
    },
  }

  -- LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use 'nvimtools/none-ls.nvim'

  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }
  use 'simrat39/symbols-outline.nvim'

  -- Golang
  use 'ray-x/go.nvim'
  use {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}

  if packer_bootstrap then
    require('packer').sync()
  end
end)
