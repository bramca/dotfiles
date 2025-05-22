-- NightFox Theme
local M = {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
}

function M.config()
  require('nightfox').setup({
    options = {
      dim_inactive = true,
      -- Enable for transparency, together with the terminal
      -- transparent = true
    },
    palettes = {
      -- Custom nightfox with darker background
      nightfox = {
        bg1 = "#151b23", -- Darker background
        bg0 = "#0c1116", -- Alt backgrounds (floats, statusline, ...)
      },
    }
  })

  vim.cmd.colorscheme "nightfox"

  -- Turn on transparency
  vim.api.nvim_create_user_command('TransparentOn', function()
    require('nightfox').setup({
      options = {
        dim_inactive = false,
        transparent = true,
      },
      palettes = {
        -- Custom nightfox with darker background
        nightfox = {
          bg1 = "#151b23", -- Darker background
          bg0 = "#0c1116", -- Alt backgrounds (floats, statusline, ...)
        },
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
      },
      palettes = {
        -- Custom nightfox with darker background
        nightfox = {
          bg1 = "#151b23", -- Darker background
          bg0 = "#0c1116", -- Alt backgrounds (floats, statusline, ...)
        },
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
    require('nightfox').setup({
      options = {
        dim_inactive = true,
        transparent = false,
      },
      palettes = {
        -- Custom nightfox with darker background
        nightfox = {
          bg1 = "#151b23", -- Darker background
          bg0 = "#0c1116", -- Alt backgrounds (floats, statusline, ...)
        },
      }
    })

    vim.cmd.colorscheme "nightfox"
  end, {})
end

return M
