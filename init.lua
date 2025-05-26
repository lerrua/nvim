-- Set options and keymaps before loading plugins
require("config.options")
require("config.keymaps")

-- Initialize lazy.nvim and load plugins
require("config.lazy-setup")

-- Set others configurations
require("config.diagnostics")
