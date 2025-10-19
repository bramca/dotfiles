require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- System Clipboard
-- mac os: 'unnamed', linux: 'unnamedplus'
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Term gui colors
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- DAP breakpoint icon
vim.fn.sign_define("DapBreakpoint",{ text = "®", texthl = "", linehl = "", numhl = ""})
vim.fn.sign_define("DapStopped",{ text = "»", texthl = "", linehl = "", numhl = ""})

-- UUID gen
vim.api.nvim_create_user_command('Uuid', function ()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local handle = io.popen('uuidgen | tr "[:upper:]" "[:lower:]" | tr -d "\n"')
  local uuid = handle:read("*a")
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { uuid })
end, {})

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = {"*"},
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

-- Set json formatter
vim.api.nvim_create_autocmd("FileType",  {
      pattern = { "json" },
      callback = function()
        vim.api.nvim_set_option_value("formatprg", "jq", { scope = 'local' })
      end,
})
