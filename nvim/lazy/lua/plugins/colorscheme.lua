 -- Github Theme
local M = {
  'projekt0n/github-nvim-theme',
  name = 'github-theme',
}

function M.config()
  require('github-theme').setup({
    options = {
      dim_inactive = true,
    }
  })

  vim.cmd.colorscheme "github_dark_default"
end

return M
