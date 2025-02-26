-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Keymaps
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap=true })
vim.keymap.set("n", "<leader>nh", [[:nohl<CR>]], { desc = "[N]o [H]ighlight" })

-- REST Client
vim.keymap.set("n", "<C-c><C-c>", [[<Plug>RestNvim<CR>]], { noremap=true })

-- Nvim Tree
vim.keymap.set("n", "<leader>to", [[:NvimTreeToggle<CR>]], { desc = "[T]ree [O]pen" })
vim.keymap.set("n", "<leader>tf", [[:NvimTreeFindFileToggle<CR>]], { desc = "[T]ree [F]ind file" })

-- Icon Picker
vim.keymap.set("n", "<C-i>", [[:Telescope symbols<CR>]], { desc = "[C]heck [I]cons" })

-- Float Terminal
vim.keymap.set("n", "<leader>ot", [[:FloatermToggle<CR>]], { desc = "[O]pen [T]erminal" })
vim.keymap.set("n", "<leader>nt", [[:FloatermNew!<CR>]], { desc = "[N]ew [T]erminal" })
vim.keymap.set("n", "<leader>th", [[:FloatermNew! cd %:p:h<CR>]], { desc = "New [T]erminal [H]ere" })
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
vim.keymap.set("n", "<leader>/", require("telescope.builtin").current_buffer_fuzzy_find, { desc = "Buffer search" })
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fc", require("telescope.builtin").git_commits, { desc = "Commits" })
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Find All Files" })
vim.keymap.set("n", "<C-p>", require("telescope.builtin").git_files, { desc = "Git files" })
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Help" })
vim.keymap.set("n", "<leader>fj", require("telescope.builtin").command_history, { desc = "History" })
vim.keymap.set("n", "<leader>fk", require("telescope.builtin").keymaps, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>fl", require("telescope.builtin").lsp_references, { desc = "Lsp References" })
vim.keymap.set("n", "<leader>fo", require("telescope.builtin").oldfiles, { desc = "Old files" })
vim.keymap.set("n", "<leader>fr", require("telescope.builtin").live_grep, { desc = "Ripgrep" })
vim.keymap.set("n", "<leader>fs", require("telescope.builtin").grep_string, { desc = "Grep String" })
vim.keymap.set("n", "<leader>ft", require("telescope.builtin").treesitter, { desc = "Treesitter" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "<leader>xw", [[:Trouble diagnostics toggle<CR>]], { desc = "Open trouble workspace diagnostics" })
vim.keymap.set("n", "<leader>xd", [[:Trouble diagnostics toggle filter.buf=0<CR>]], { desc = "Open trouble document diagnostics" })
vim.keymap.set("n", "<leader>xq", [[:Trouble quickfix toggle<CR>]], { desc = "Open trouble quickfix list" })
vim.keymap.set("n", "<leader>xl", [[:Trouble loclist toggle<CR>]], { desc = "Open trouble location list" })
vim.keymap.set("n", "<leader>xt", [[:Trouble todo toggle<CR>]], { desc = "Open todos in trouble" })

-- Yazi
vim.keymap.set("n", "<leader>-", function()
	require("yazi").yazi()
end, { desc = "Open the file manager" })
vim.keymap.set("n", "<leader>cw", function()
	require("yazi").yazi(nil, vim.fn.getcwd())
end, { desc = "Open the file manager in nvim's working directory" })

-- LSP

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "[G]oto [R]eferences" })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type [D]efinition" })
vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })

-- See `:help K` for why this keymap
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })

-- Lesser used LSP functionality
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "[W]orkspace [A]dd Folder" })
vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "[W]orkspace [R]emove Folder" })
vim.keymap.set("n", "<leader>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "[W]orkspace [L]ist Folders" })
vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, { desc = "Format current buffer with LSP" })

-- TODO comments
vim.keymap.set("n", "]t", function()
        require("todo-comments").jump_next()
end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
