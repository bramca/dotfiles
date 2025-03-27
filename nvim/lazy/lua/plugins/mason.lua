local M = {
  'williamboman/mason.nvim',
  commit = 'e2f7f9044ec30067bc11800a9e266664b88cda22',
  lazy = false,
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'nvim-lua/plenary.nvim',
  },
}

function M.init()
  require('mason').setup()
end

return M
