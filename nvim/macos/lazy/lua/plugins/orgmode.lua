-- Org mode
local M = {
  'nvim-orgmode/orgmode',
}

function M.config()
  -- Load treesitter grammar for org
  require('orgmode').setup{}
end

return M
