-- Fuzzy Finder (files, lsp, etc)
local M = {
  'nvim-telescope/telescope.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ['<C-u>'] = false,
          ['<C-d>'] = false,
        },
      },
    },
  }
}

function M.config()
  local telescope = require("telescope")
  telescope.setup({
    pickers = {
      live_grep = {
        file_ignore_patterns = { 'node_modules', '.git', '.venv' },
        additional_args = function(_)
          return { "--hidden" }
        end
      },
      find_files = {
        file_ignore_patterns = { 'node_modules', '.git', '.venv' },
        hidden = true
      }

    },
    extensions = {
      "fzf"
    },
  })
  telescope.load_extension("fzf")
end

return M
