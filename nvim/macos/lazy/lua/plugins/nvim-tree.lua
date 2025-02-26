-- Nvim tree
local M = {
  'nvim-tree/nvim-tree.lua',
  opts = {
    disable_netrw = true,
    update_cwd = true,
    renderer = {
      icons = {
        show = {
          file = false,
          folder_arrow = false,
          git = false,
        },
        glyphs = {
          folder = {
            default = '>',
            open = 'v',
            empty = '>',
            empty_open = 'v',
          }
        },
      },
      indent_markers = {
        enable = true,
      }
    }
  }
}

return M
