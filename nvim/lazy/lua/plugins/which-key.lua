-- Keymap info
local M = {
  'folke/which-key.nvim',
  event = 'VeryLazy',
}

function M.init()
  vim.o.timeout = true
  vim.o.timeoutlen = 500
end

return M
