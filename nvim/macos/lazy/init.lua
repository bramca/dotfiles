local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " " -- Same for `maplocalleader`

require("lazy").setup("plugins")

vim.fn.sign_define("DapBreakpoint",{ text = "🔴", texthl = "", linehl = "", numhl = ""})
vim.fn.sign_define("DapStopped",{ text = "⏩", texthl = "", linehl = "", numhl = ""})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- System Clipboard
vim.o.clipboard = 'unnamed'

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

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme nightfox]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- [[ Remove trailing whitespace on save ]]
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = {"*"},
  callback = function()
    save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

-- Keymaps
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap=true })

-- REST Client
vim.keymap.set("n", "<C-c><C-c>", [[<Plug>RestNvim<CR>]], { noremap=true })

-- Nvim Tree
vim.keymap.set("n", "<leader>to", [[:NvimTreeToggle<CR>]], { desc = "[T]ree [O]pen" })

-- Icon Picker
vim.keymap.set("n", "<C-i>", [[:Telescope symbols<CR>]], { desc = "[C]heck [I]cons" })

-- Float Terminal
vim.keymap.set("n", "<leader>ot", [[:FloatermToggle<CR>]], { desc = "[O]pen [T]erminal" })
vim.keymap.set("n", "<leader>nt", [[:FloatermNew!<CR>]], { desc = "[N]ew [T]erminal" })
vim.keymap.set("n", "<leader>th", [[:FloatermNew! cd %:p:h<CR>]], { desc = "New [T]erminal [H]ere" })
vim.keymap.set("n", "<leader>tf", [[:FloatermFirst<CR>]], { desc  = "[T]erminal [F]irst" })
vim.keymap.set("n", "<leader>tn", [[:FloatermNext<CR>]], { desc = "[T]erminal [N]ext" })
vim.keymap.set("n", "<leader>gu", [[:FloatermNew lazygit<CR>]], { desc = "[G]it [U]i" })
vim.keymap.set("n", "<leader>tp", [[:FloatermNew btop<CR>]], { desc = "[T]erminal [P]rocesses" })

-- Terminal
vim.keymap.set("n", "<leader>tv", [[:vsplit | terminal<CR>]], { desc = "[T]erminal in [V]ertical split" })
vim.keymap.set("n", "<leader>tx", [[:split | terminal<CR>]], { desc = "[T]erminal in horizontal [S]plit" })
vim.keymap.set("n", "<leader>tb", [[:tabnew | terminal<CR>]], { desc = "[T]erminal in new [T]ab" })

-- Testing
vim.keymap.set('n', '<leader>ts', [[:TestNearest<CR>]], { desc = '[T]estNeare[S]t' })
vim.keymap.set("n", "<leader>ta", [[:lua require("neotest").run.run(vim.fn.expand("%"))<CR>]], { desc = "[T]est [A]ll in file" })
vim.keymap.set("n", "<leader>ti", [[:lua require("neotest").run.run()<CR>]], { desc = "[T]est Neare[S]t" })
vim.keymap.set("n", "<leader>tr", [[:lua require("neotest").run.run({vim.fn.getcwd(), extra_args = {"./..."}})<CR>]], { desc = "[T]est project [R]oot" })
vim.keymap.set("n", "<leader>os", [[:lua require("neotest").summary.open()<CR>]], { desc = "[O]pen [S]ummary" })
vim.keymap.set("n", "<leader>cs", [[:lua require("neotest").summary.close()<CR>]], { desc = "[C]lose [S]ummary" })
vim.keymap.set("n", "<leader>oo", [[:lua require("neotest").output_panel.open()<CR>]], { desc = "[O]pen [O]utput panel" })
vim.keymap.set("n", "<leader>co", [[:lua require("neotest").output_panel.close()<CR>]], { desc = "[C]lose [O]utput panel" })
vim.keymap.set("n", "<leader>td", [[:lua require("dap-go").debug_test()<CR>]], { desc = "[T]est [D]ebug" })

-- Git
vim.keymap.set("n", "<leader>gg", [[:Git<CR>]], { desc = "[G]it status" })

-- Buffer switch
vim.keymap.set("n", "<leader>bl", [[:b#<CR>]], { desc = "Previous [B]uffer" })

-- DAP (Debug Adapter Protocol)
vim.keymap.set("n", "<F5>", require "dap".continue)
vim.keymap.set("n", "<F10>", require "dap".step_over)
vim.keymap.set("n", "<F11>", require "dap".step_into)
vim.keymap.set("n", "<F12>", require "dap".step_out)
vim.keymap.set("n", "<leader>b", require "dap".toggle_breakpoint)
vim.keymap.set("n", "<leader>cab", require "dap".clear_breakpoints)
vim.keymap.set("n", "<leader>dt", require "dap".terminate)
vim.keymap.set("n", "<leader>fv", [[:lua require("dapui").float_element("scopes")<CR>:lua require("dapui").float_element("scopes")<CR>]], { desc = "[F]loating [V]ariables window"})

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>fd", function()
  require("telescope.builtin").find_files({ cwd = "~/dev" })
end, { desc = "Search [F]iles in [D]evelop" })
vim.keymap.set("n", "<leader>fn", function()
  require("telescope.builtin").find_files({ cwd = "~/notes" })
end, { desc = "Search [F]iles in [N]otes" })
vim.keymap.set("n", "<leader>gd", function()
  require("telescope.builtin").live_grep({ cwd = "~/dev" })
end, { desc = "Search by [G]rep in [D]evelop"})
vim.keymap.set("n", "<leader>sn", function()
  require("telescope.builtin").live_grep({ cwd = "~/notes" })
end, { desc = "[S]earch by Grep in [N]otes"})
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

