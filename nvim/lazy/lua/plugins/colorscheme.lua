-- Github Theme
-- local M = {
--   'projekt0n/github-nvim-theme',
--   name = 'github-theme',
-- }
--
-- function M.config()
--   require('github-theme').setup({
--     options = {
--       dim_inactive = true,
--     }
--   })
--
--   vim.cmd.colorscheme "github_dark_default"
-- end
--
-- return M

-- Sonokai Theme
local M = {
  'sainnhe/sonokai',
}

function M.config()
  vim.g.sonokai_dim_inactive_windows = 1
  vim.g.sonokai_style = "andromeda"
  vim.g.sonokai_better_performance = 1
  vim.g.sonokai_enable_italic = 1
  vim.cmd.colorscheme "sonokai"
end

return M
