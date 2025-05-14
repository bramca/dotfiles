-- Yazi file manager
local M = {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  dependencies = {
    -- check the installation instructions at
    -- https://github.com/folke/snacks.nvim
    "folke/snacks.nvim"
  },
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    integrations = {
      grep_in_directory = function(directory)
        require("snacks").picker.grep({ cwd = directory })
      end,
    },
  }
}

return M
