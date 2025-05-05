-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- I know what I'm doing (I guess )
vim.g.lazyvim_check_order = false

-- DAP breakpoint icon
vim.fn.sign_define("DapBreakpoint", { text = "®", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "»", texthl = "", linehl = "", numhl = "" })
