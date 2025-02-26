-- Markdown Preview

local M = {
  'iamcco/markdown-preview.nvim',
}

function M.build()
  vim.fn['mkdp#util#install']()
end

return M
