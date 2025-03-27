-- Homsecreen Dashboard
local M = {
  'nvimdev/dashboard-nvim',
  lazy = false,
  event = 'VimEnter',
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}

function M.config()
  require('dashboard').setup {
    -- config
    config = {
      week_header = {
        enable = true,
      },
    },
  }
end

return M
