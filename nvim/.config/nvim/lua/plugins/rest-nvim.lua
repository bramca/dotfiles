-- REST Client
local M = {
  'rest-nvim/rest.nvim',
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "http")
    end,
  },
}

function M.config()
  vim.g.rest_nvim = {
    env = {
      enable = true,
      pattern = ".*%.env.*",
      find = function()
        local config = require("rest-nvim.config")
        return vim.fs.find(function(name, _)
          return name:match(config.env.pattern)
        end, {
          path = vim.fn.expand("%:p"),
          type = "file",
          limit = math.huge,
        })
      end,
    },
  }
end

return M
