-- Add indentation guides even on blank lines
local M = {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  version = "3.5.4",
}

function M.config()
  require('ibl').setup {
    exclude = {
      filetypes = { 'dashboard' },
    }
  }
end

return M
