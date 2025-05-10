-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Keymaps
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap=true })
vim.keymap.set("n", "<leader>nh", [[:nohl<CR>]], { desc = "No Highlight" })

-- Maintenance
vim.keymap.set("n", "<leader>L", [[:Lazy<CR>]], { desc = "Lazy Plugins" })
vim.keymap.set("n", "<leader>M", [[:Mason<CR>]], { desc = "Mason" })

-- REST Client
vim.keymap.set("n", "<C-c><C-c>", [[:Rest run<CR>]], { noremap=true })

-- Float Terminal
vim.keymap.set("n", "<leader>ot", [[:FloatermToggle<CR>]], { desc = "Open Terminal" })
vim.keymap.set("n", "<leader>nt", [[:FloatermNew! --height=0.8 --width=0.8<CR>]], { desc = "New Terminal" })
vim.keymap.set("n", "<leader>th", [[:FloatermNew! --height=0.8 --width=0.8 cd %:p:h<CR>]], { desc = "New Terminal Here" })
vim.keymap.set("n", "<leader>tn", [[:FloatermNext<CR>]], { desc = "Terminal Next" })
vim.keymap.set("n", "<leader>cx", [[:FloatermUpdate --wintype=split --height=0.3<CR>]], { desc = "Change Terminal to Horizontal Split" })
vim.keymap.set("n", "<leader>cv", [[:FloatermUpdate --wintype=vsplit --width=0.5<CR>]], { desc = "Change Terminal to Vertical Split" })
vim.keymap.set("n", "<leader>cf", [[:FloatermUpdate --wintype=float --width=0.8 --height=0.8 --position=center<CR>]], { desc = "Change Terminal to Floating" })
vim.keymap.set("n", "<leader>tp", [[:FloatermNew --height=0.8 --width=0.8 btop<CR>]], { desc = "Terminal Processes" })
vim.keymap.set("n", "<leader>ld", [[:FloatermNew --height=0.8 --width=0.8 lazydocker<CR>]], { desc = "Lazy Docker" })
vim.keymap.set("n", "<leader>lq", [[:FloatermNew --height=0.8 --width=0.8 lazysql<CR>]], { desc = "Lazy SQL" })

-- Terminal
vim.keymap.set("n", "<leader>tv", [[:vsplit | terminal<CR>]], { desc = "Terminal in Vertical Split" })
vim.keymap.set("n", "<leader>tx", [[:split | terminal<CR>]], { desc = "Terminal in Horizontal Split" })
vim.keymap.set("n", "<leader>tb", [[:tabnew | terminal<CR>]], { desc = "Terminal in New Tab" })

-- Testing
vim.keymap.set('n', '<leader>ts', [[:TestNearest<CR>]], { desc = 'Test Nearest' })
vim.keymap.set("n", "<leader>ta", [[:lua require("neotest").run.run(vim.fn.expand("%"))<CR>]], { desc = "Test All in File" })
vim.keymap.set("n", "<leader>ti", [[:lua require("neotest").run.run()<CR>]], { desc = "Test Nearest with Neo" })
vim.keymap.set("n", "<leader>tr", [[:lua require("neotest").run.run({vim.fn.getcwd(), extra_args = {"./..."}})<CR>]], { desc = "Test All in Project Root" })
vim.keymap.set("n", "<leader>os", [[:lua require("neotest").summary.open()<CR>]], { desc = "Open Test Summary" })
vim.keymap.set("n", "<leader>cs", [[:lua require("neotest").summary.close()<CR>]], { desc = "Close Test Summary" })
vim.keymap.set("n", "<leader>oo", [[:lua require("neotest").output_panel.open()<CR>]], { desc = "Open Test Output panel" })
vim.keymap.set("n", "<leader>co", [[:lua require("neotest").output_panel.close()<CR>]], { desc = "Close Test Output panel" })
vim.keymap.set("n", "<leader>td", [[:lua require("dap-go").debug_test()<CR>]], { desc = "Test Debug" })

-- Git
vim.keymap.set("n", "<leader>lg", function() require("snacks").lazygit() end, { desc = "Lazy Git" })

-- Buffer switch
vim.keymap.set("n", "<leader>bl", [[:b#<CR>]], { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>bh", [[:bn<CR>]], { desc = "Next Buffer" })

vim.keymap.set("n", "<leader>ha", function() require("harpoon"):list():add() end, { desc = "Harpoon Add file" })
vim.keymap.set("n", "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, { desc = "Harpoon Quick Menu" })

vim.keymap.set("n", "<C-a>", function() require("harpoon"):list():select(1) end, { desc = "Harpoon file 1" })
vim.keymap.set("n", "<C-d>", function() require("harpoon"):list():select(2) end, { desc = "Harpoon file 2" })
vim.keymap.set("n", "<C-g>", function() require("harpoon"):list():select(3) end, { desc = "Harpoon file 3" })
vim.keymap.set("n", "<C-j>", function() require("harpoon"):list():select(4) end, { desc = "Harpoon file 4" })

vim.keymap.set("n", "<leader>hp", function() require("harpoon"):list():prev() end, { desc = "Harpoon Previous buffer" })
vim.keymap.set("n", "<leader>hn", function() require("harpoon"):list():next() end, { desc = "Harpoon Next buffer" })

-- DAP (Debug Adapter Protocol)
vim.keymap.set("n", "<leader>dc", require "dap".continue, { desc = 'DAP Continue' })
vim.keymap.set("n", "<leader>do", require "dap".step_over, { desc = 'DAP Step Over' })
vim.keymap.set("n", "<leader>di", require "dap".step_into, { desc = 'DAP Step Into' })
vim.keymap.set("n", "<leader>dx", require "dap".step_out, { desc = 'DAP Step Out' })
vim.keymap.set("n", "<leader>ba", require "dap".toggle_breakpoint, { desc = 'DAP Add Breakpoint' })
vim.keymap.set("n", "<leader>cb", require "dap".clear_breakpoints, { desc = 'Clear All Breakpoints' })
vim.keymap.set("n", "<leader>dt", require "dap".terminate, { desc = 'DAP Terminate' })
vim.keymap.set("n", "<leader>fv", [[:lua require("dapui").float_element("scopes")<CR>:lua require("dapui").float_element("scopes")<CR>]], { desc = "Floating Variables window"})

-- Find Files
vim.keymap.set("n", "<leader>fe", function() require("snacks").explorer() end, { desc = "File Explorer" })
vim.keymap.set("n", "<leader>ff", require("snacks").picker.files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fb", require("snacks").picker.buffers, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fg", require("snacks").picker.git_files, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>fr", require("snacks").picker.recent, { desc = "Find Recent Files" })
vim.keymap.set("n", "<leader>fP", function() require("snacks").picker.files({ cwd = "~/dev" }) end, { desc = "Find Projects" })
vim.keymap.set("n", "<leader>fn", function() require("snacks").picker.files({ cwd = "~/notes" }) end, { desc = "Find Notes" })
vim.keymap.set("n", "<leader>fc", function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config File" })
vim.keymap.set("n", "<leader>f.", function() require("snacks").picker.files({ cwd = vim.fn.expand("%:p:h") }) end, { desc = "Find Files in Buffer Dir" })

-- Grep
vim.keymap.set("n", "<leader>/", require("snacks").picker.lines, { desc = "Search Buffer" })
vim.keymap.set("n", "<leader>s.", function() require("snacks").picker.grep({ cwd = vim.fn.expand("%:p:h") }) end, { desc = "Search in Buffer Dir" })
vim.keymap.set("n", "<leader>sP", function() require("snacks").picker.grep({ cwd = "~/dev" }) end, { desc = "Search in Projects"})
vim.keymap.set("n", "<leader>sc", function() require("snacks").picker.grep({ cwd = vim.fn.stdpath("config") }) end, { desc = "Search in Config Files"})
vim.keymap.set("n", "<leader>sw", require("snacks").picker.grep_word, { desc = "Search Word" })
vim.keymap.set("n", "<leader>sn", function() require("snacks").picker.grep({ cwd = "~/notes" }) end, { desc = "Search in Notes"})
vim.keymap.set("n", "<leader>sb", require("snacks").picker.grep_buffers, { desc = "Search in Buffer Files" })
vim.keymap.set("n", "<leader>sg", require("snacks").picker.grep, { desc = "Search Grep" })

-- Other
vim.keymap.set("n", "<leader>sN", require("snacks").picker.notifications, { desc = "Search Notifications" })
vim.keymap.set("n", '<leader>s"', require("snacks").picker.registers, { desc = "Search Registers" })
vim.keymap.set("n", "<leader>sh", require("snacks").picker.help, { desc = "Search Help" })
vim.keymap.set("n", "<leader>sH", require("snacks").picker.command_history, { desc = "Search Command History" })
vim.keymap.set("n", "<leader>sC", require("snacks").picker.commands, { desc = "Search Command" })
vim.keymap.set("n", "<leader>sk", require("snacks").picker.keymaps, { desc = "Search Keymaps" })
vim.keymap.set("n", "<leader>sM", require("snacks").picker.man, { desc = "Search Man Pages" })
vim.keymap.set("n", "<leader>si", require("snacks").picker.icons, { desc = "Search Icons" })
vim.keymap.set("n", "<leader>sp", require("snacks").picker.lazy, { desc = "Search Plugins" })
vim.keymap.set("n", "<leader>su", require("snacks").picker.undo, { desc = "Search Undo History" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>sd", require("snacks").picker.diagnostics, { desc = "Search Diagnostics" })
vim.keymap.set("n", "<leader>sD", require("snacks").picker.diagnostics_buffer, { desc = "Search Buffer Diagnostics" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = 'Diagnostic Previous Issue' })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = 'Diagnostic Next Issue' })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = 'Diagnostic Open issue Info' })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = 'Diagnostic Show Locations' })
vim.keymap.set("n", "<leader>xw", [[:Trouble diagnostics toggle<CR>]], { desc = "Open Workspace Diagnostics" })
vim.keymap.set("n", "<leader>xd", [[:Trouble diagnostics toggle filter.buf=0<CR>]], { desc = "Open Document Diagnostics" })
vim.keymap.set("n", "<leader>xq", [[:Trouble quickfix toggle<CR>]], { desc = "Open Diagnostics Quickfix List" })
vim.keymap.set("n", "<leader>xl", [[:Trouble loclist toggle<CR>]], { desc = "Open Diagnostics Location List" })
vim.keymap.set("n", "<leader>xt", [[:Trouble todo toggle<CR>]], { desc = "Open TODOs" })

-- Yazi
vim.keymap.set("n", "<leader>-", function() require("yazi").yazi() end, { desc = "Open Yazi File Manager" })
vim.keymap.set("n", "<leader>cw", function() require("yazi").yazi(nil, vim.fn.getcwd()) end, { desc = "Open Yazi File Manager Current Working Dir" })

-- LSP
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set("n", "gr", require("snacks").picker.lsp_references, { desc = "Goto References" })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type Definition" })
vim.keymap.set("n", "<leader>ds", require("snacks").picker.lsp_symbols, { desc = "Document Symbols" })
vim.keymap.set("n", "<leader>ws", require("snacks").picker.lsp_workspace_symbols, { desc = "Workspace Symbols" })

-- See `:help K` for why this keymap
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })

-- Lesser used LSP functionality
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Workspace Add Folder" })
vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Workspace Remove Folder" })
vim.keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { desc = "Workspace List Folders" })
vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, { desc = "Format current buffer with LSP" })

-- TODO comments
vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next TODO Comment" })
vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous TODO Comment" })
