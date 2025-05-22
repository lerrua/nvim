-- Set barbar's options
require("bufferline").setup({
  highlights = require("catppuccin.groups.integrations.bufferline").get(),
  options = {
    color_icons = false,
    separator_style = "slant",
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
