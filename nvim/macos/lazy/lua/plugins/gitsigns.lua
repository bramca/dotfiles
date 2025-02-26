-- Git
local M = {
  'lewis6991/gitsigns.nvim',
  lazy = false,
}

function M.config()
  require('gitsigns').setup()
end

return M
