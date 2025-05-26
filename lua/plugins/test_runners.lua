return {
  -- Test Runners
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-python",
      "olimorris/neotest-rspec",
      "nvim-neotest/neotest-go",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-vitest"),
          require("neotest-python"),
          require("neotest-rspec"),
          require("neotest-go"),
          require("rustaceanvim.neotest"),
          require("neotest-jest")({
            jestCommand = "yarn test --watchAll=false --passWithNoTests",
            jestConfigFile = "custom.jest.config.ts",
            env = {
              CI = true,
            },
            cwd = function()
              return vim.fn.getcwd()
            end,
          }),
        },
      })
    end,
  },
}
