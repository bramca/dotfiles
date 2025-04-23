-- Fancier statusline
local M = {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '|', right = '|' },
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {{'filename', path=1}},
      lualine_x = {
        {
          require('lazy.status').updates,
          cond = require('lazy.status').has_updates,
          color = { fg = '#ff9e64' },
        },
        {'encoding'},
        {'fileformat'},
        {'filetype'},
      },
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
  },
}

return M
