-- DAP Golang
local M = {
  'leoluz/nvim-dap-go',
  lazy = false,
}

function M.config()
  require('dap-go').setup()
end

return M
