-- Markdown Preview

local M = {
  'iamcco/markdown-preview.nvim',
  build = "cd app && npm install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
}

return M
