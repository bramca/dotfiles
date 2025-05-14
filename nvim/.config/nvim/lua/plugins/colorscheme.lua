-- Github Theme
local M = {
  'projekt0n/github-nvim-theme',
  name = 'github-theme',
}

function M.config()
  require('github-theme').setup({
    options = {
      -- dim_inactive = true,
      -- Enable for transparency, together with the terminal
      transparent = true
    }
  })

  vim.cmd.colorscheme "github_dark_default"

  -- Turn on transparency
  vim.api.nvim_create_user_command('TransparentOn', function()
    require('github-theme').setup({
      options = {
        dim_inactive = false,
        transparent = true,
      }
    })

    vim.cmd.colorscheme(vim.g.colors_name)
  end, {})

  -- Turn off transparency
  vim.api.nvim_create_user_command('TransparentOff', function()
    require('github-theme').setup({
      options = {
        dim_inactive = true,
        transparent = false,
      }
    })

    vim.cmd.colorscheme(vim.g.colors_name)
  end, {})

  -- Toggle light theme
  vim.api.nvim_create_user_command('LightTheme', function()
    local theme = require('github-theme')
    theme.setup({
      options = {
        dim_inactive = true,
        transparent = false,
      }
    })

    vim.cmd.colorscheme "github_light_default"
  end, {})

  -- Toggle light theme
  vim.api.nvim_create_user_command('DarkTheme', function()
    vim.cmd.colorscheme "github_dark_default"
  end, {})
end

return M
