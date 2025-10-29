#!/bin/bash

go install golang.org/x/tools/gopls@latest
rustup component add rust-analyzer

nvim --headless -c 'exe "write ++p" stdpath("config") . "/init.lua"' -c 'quit'
nvim --headless -c 'echo $MYVIMRC' -c 'quit'
nvim --headless -c 'call mkdir(stdpath("config") . "/pack/vendor/start/", "p")' -c 'quit'
nvim --headless -c 'echo stdpath("config") . "/pack/vendor/start/"' -c 'quit'
cd ~/.config/nvim/pack/vendor/start
git clone https://github.com/neovim/nvim-lspconfig
git clone --filter=blob:none https://github.com/nvim-mini/mini.nvim
nvim --headless -c 'helptags ALL' -c 'quit'
cat > ~/.config/nvim/init.lua << EOF
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.wrap = true
vim.o.hlsearch = false
vim.o.signcolumn = 'yes'
vim.o.autochdir = true

-- Space as the leader key
vim.g.mapleader = vim.keycode('<Space>')

-- Basic clipboard interaction
vim.keymap.set({'n', 'x'}, 'gy', '"+y', {desc = 'Copy to clipboard'})
vim.keymap.set({'n', 'x'}, 'gp', '"+p', {desc = 'Paste clipboard text'})

-- Command shortcuts
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', {desc = 'Save file'})
vim.keymap.set('n', '<leader>q', '<cmd>quitall<cr>', {desc = 'Exit vim'})

vim.cmd.colorscheme('retrobox')

require('mini.icons').setup({})
require('mini.pairs').setup({})
require('mini.statusline').setup({})
require('mini.indentscope').setup({})
require('mini.trailspace').setup({})
require('mini.starter').setup({})

require('mini.snippets').setup({})
require('mini.completion').setup({})
require('mini.files').setup({})

vim.keymap.set('n', '<leader>e', '<cmd>lua MiniFiles.open()<cr>', {desc = 'File explorer'})

require('mini.pick').setup({})
vim.keymap.set('n', '<leader><space>', '<cmd>Pick buffers<cr>', {desc = 'Search open files'})
vim.keymap.set('n', '<leader>ff', '<cmd>Pick files<cr>', {desc = 'Search all files'})
vim.keymap.set('n', '<leader>fg', '<cmd>Pick grep_live<cr>', {desc = 'Search all files'})
vim.keymap.set('n', '<leader>fh', '<cmd>Pick help<cr>', {desc = 'Search help tags'})

-- List of compatible language servers is here:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
vim.lsp.enable({'gopls', 'rust_analyzer'})
EOF
