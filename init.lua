-- Set options and keymaps before loading plugins
require("configs.options")
require("config.keymaps")

-- Initialize lazy.nvim and load plugins
require("configs.lazy-setup")

-- Set others configurations
require("configs.diagnostics")
