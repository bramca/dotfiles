-- NightFox Theme
local M = {
  "EdenEast/nightfox.nvim"
}

function M.config()
  require('nightfox').setup({
    options = {
      -- dim_inactive = true,
      -- Enable for transparency, together with the terminal
      transparent = true
    }
  })

  vim.cmd.colorscheme "nightfox"

  -- Turn on transparency
  vim.api.nvim_create_user_command('TransparentOn', function()
    require('nightfox').setup({
      options = {
        dim_inactive = false,
        transparent = true,
      }
    })

    vim.cmd.colorscheme(vim.g.colors_name)
  end, {})

  -- Turn off transparency
  vim.api.nvim_create_user_command('TransparentOff', function()
    require('nightfox').setup({
      options = {
        dim_inactive = true,
        transparent = false,
      }
    })

    vim.cmd.colorscheme(vim.g.colors_name)
  end, {})

  -- Toggle light theme
  vim.api.nvim_create_user_command('LightTheme', function()
    require('nightfox').setup({
      options = {
        dim_inactive = true,
        transparent = false,
      }
    })

    vim.cmd.colorscheme "dayfox"
  end, {})

  -- Toggle light theme
  vim.api.nvim_create_user_command('DarkTheme', function()
    vim.cmd.colorscheme "nightfox"
  end, {})
end

return M
