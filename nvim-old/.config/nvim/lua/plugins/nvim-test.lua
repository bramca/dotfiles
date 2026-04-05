local M = {
  'klen/nvim-test',
}

function M.config()
  require('nvim-test').setup()
end

return M
