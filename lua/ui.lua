-- require("utils")

-- UI
vim.t_Co = 256
vim.opt.termguicolors = true
-- vim.opt.background = "light"
-- local colorscheme = 'zenbones'
-- local colorscheme = 'nano-theme'

-- other colorscheme options
-- local colorscheme = 'rosebones'
-- local colorscheme = 'catppuccin-frappe'
-- local colorscheme = 'catppuccin-latte'
local colorscheme = 'catppuccin-mocha'

-- local hr = tonumber(os.date('%H', os.time()))
-- if hr > 18 or hr < 7 then -- dark mode on local time between 6PM and 7AM
--   vim.opt.background = "dark"
-- end

require("catppuccin").setup {
  integrations = {
    notify = true,
  },
  styles = {
    strings = { "italic" },
    conditionals = { "italic" },
  },
  color_overrides = {
    latte = {
      rosewater = "#fdf7e8",
      flamingo = "#cb4b16",
      pink = "#d33682",
      mauve = "#6c71c4",
      red = "#dc322f",
      maroon = "#c03260",
      peach = "#cb4b1f",
      yellow = "#b58900",
      green = "#859900",
      teal = "#2aa198",
      sky = "#2398d2",
      sapphire = "#0077b3",
      blue = "#268bd2",
      lavender = "#7b88d3",
      text = "#657b83",
      subtext1 = "#586e75",
      subtext0 = "#073642",
      overlay2 = "#002b36",
      overlay1 = "#839496",
      overlay0 = "#93a1a1",
      surface2 = "#eee8d5",
      surface1 = "#c3c4c7",
      surface0 = "#ccd0da",
      base = "#fdf6e3",
      mantle = "#f7f1dc",
      crust = "#f5ecd7",
    },
  },
  highlight_overrides = {
    latte = function(C)
      return {
        FlashLabel = { fg = C.base, bg = C.red, style = { "bold" } },
      }
    end,
  },
}

vim.cmd("colorscheme " .. colorscheme)

-- UI components should be configured through lazy.nvim's config option
-- but we're keeping these here for backward compatibility during the transition

-- UI improvements
if require("lazy.core.config").plugins["dressing.nvim"] then
  require('dressing').setup()
end

if require("lazy.core.config").plugins["which-key.nvim"] then
  require("which-key").setup()
end

if require("lazy.core.config").plugins["namu.nvim"] then
  require("namu").setup()
end

-- require("e-ink").setup()
-- vim.cmd("colorscheme e-ink")

if require("lazy.core.config").plugins["grug-far.nvim"] then
  require('grug-far').setup()
end
