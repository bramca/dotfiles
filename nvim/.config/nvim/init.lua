vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end

require "options"
require "autocmds"

require("telescope").setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git",
      "venv",
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
      hidden = true,
    },
    grep_string = {
      theme = "ivy",
      additional_args = { "--hidden" },
    },
    live_grep = {
      theme = "ivy",
      additional_args = { "--hidden" },
    },
    lsp_document_symbols = {
      theme = "ivy",
    },
    lsp_workspace_symbols = {
      theme = "ivy",
    },
    lsp_references = {
      theme = "ivy",
    },
    buffers = {
      theme = "ivy",
    },
    oldfiles = {
      theme = "ivy",
    },
    git_files = {
      theme = "ivy",
    },
    current_buffer_fuzzy_find = {
      theme = "ivy",
    },
    diagnostics = {
      theme = "ivy",
    },
  },
}

require("nvim-tree").setup {
  git = {
    enable = false,
  },
}

vim.schedule(function()
  require "mappings"
end)
