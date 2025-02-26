-- TODO comments
local M = {
  'folke/todo-comments.nvim',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
  require("todo-comments").setup()
end

return M
