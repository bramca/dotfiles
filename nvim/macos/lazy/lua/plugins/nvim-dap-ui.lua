-- DAP UI
local M = {
  'rcarriga/nvim-dap-ui',
  lazy = false,
  dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
}

function M.config()
  local dapui = require("dapui")
  dapui.setup()
end

return M
