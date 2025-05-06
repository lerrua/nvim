-- Set barbar's options
require("bufferline").setup({
  options = {
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
