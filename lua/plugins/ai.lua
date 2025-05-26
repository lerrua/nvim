return {
  -- AI Assistants
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<C-a>",
            dismiss = "<M-l>",
          },
        },
        panel = { enabled = false },
      })
    end,
  },
  {
    "yetone/avante.nvim",
    branch = "main",
    build = "make",
    config = function()
      require("avante_lib").load()
      require("avante").setup({
        provider = "copilot",
        copilot = {
          model = "claude-3.7-sonnet",
        },
      })
    end,
  },
}
