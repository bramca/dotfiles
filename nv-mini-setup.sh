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
-- Options
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
vim.o.clipboard = "unnamedplus"

-- Colorscheme
vim.cmd.colorscheme('retrobox')

-- Mini setup
require('mini.icons').setup({})
require('mini.pairs').setup({})
require('mini.statusline').setup({})
require('mini.indentscope').setup({})
require('mini.trailspace').setup({})
require('mini.starter').setup({})
require('mini.snippets').setup({})
require('mini.completion').setup({})
require('mini.files').setup({})
require('mini.pick').setup({})

-- Space as the leader key
vim.g.mapleader = vim.keycode('<Space>')

-- Keymaps
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Goto References" })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type Definition" })
vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, { desc = "Document Symbols" })
vim.keymap.set('n', '<leader><space>', '<cmd>Pick buffers<cr>', {desc = 'Search open files'})
vim.keymap.set('n', '<leader>ff', '<cmd>Pick files<cr>', {desc = 'Search all files'})
vim.keymap.set('n', '<leader>sg', '<cmd>Pick grep_live<cr>', {desc = 'Search all files'})
vim.keymap.set('n', '<leader>fh', '<cmd>Pick help<cr>', {desc = 'Search help tags'})

-- List of compatible language servers is here:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
vim.lsp.enable({'gopls', 'rust_analyzer'})
EOF
