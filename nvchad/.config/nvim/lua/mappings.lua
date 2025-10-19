require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Keymaps for better default experience
-- See `:help map()`
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Remap for scrolling
map('n', '<C-p>' , 'kzz', { silent = true })
map('n', '<C-n>' , 'jzz', { silent = true })

-- Keymaps
map("t", "<Esc>", [[<C-\><C-n>]], { noremap=true })
map("n", "<leader>nh", [[:nohl<CR>]], { desc = "No Highlight" })

-- Maintenance
map("n", "<leader>L", [[:Lazy<CR>]], { desc = "Lazy Plugins" })
map("n", "<leader>M", [[:Mason<CR>]], { desc = "Mason" })

-- REST Client
map("n", "<C-c><C-c>", [[:Rest run<CR>]], { noremap=true })

-- Float Terminal
map("n", "<leader>ot", [[:FloatermToggle<CR>]], { desc = "Open Terminal" })
map("n", "<leader>nt", [[:FloatermNew! --height=0.8 --width=0.8<CR>]], { desc = "New Terminal" })
map("n", "<leader>th", [[:FloatermNew! --height=0.8 --width=0.8 cd %:p:h<CR>]], { desc = "New Terminal Here" })
map("n", "<leader>tn", [[:FloatermNext<CR>]], { desc = "Terminal Next" })
map("n", "<leader>cx", [[:FloatermUpdate --wintype=split --height=0.3<CR>]], { desc = "Change Terminal to Horizontal Split" })
map("n", "<leader>cv", [[:FloatermUpdate --wintype=vsplit --width=0.5<CR>]], { desc = "Change Terminal to Vertical Split" })
map("n", "<leader>cf", [[:FloatermUpdate --wintype=float --width=0.8 --height=0.8 --position=center<CR>]], { desc = "Change Terminal to Floating" })
map("n", "<leader>tp", [[:FloatermNew --height=0.8 --width=0.8 btop<CR>]], { desc = "Terminal Processes" })
map("n", "<leader>ld", [[:FloatermNew --height=0.8 --width=0.8 lazydocker<CR>]], { desc = "Lazy Docker" })
map("n", "<leader>lq", [[:FloatermNew --height=0.8 --width=0.8 lazysql<CR>]], { desc = "Lazy SQL" })

-- Terminal
map("n", "<leader>tv", [[:vsplit | terminal<CR>]], { desc = "Terminal in Vertical Split" })
map("n", "<leader>tx", [[:split | terminal<CR>]], { desc = "Terminal in Horizontal Split" })
map("n", "<leader>tb", [[:tabnew | terminal<CR>]], { desc = "Terminal in New Tab" })

-- Testing
map('n', '<leader>ts', [[:TestNearest<CR>]], { desc = 'Test Nearest' })
map("n", "<leader>td", [[:lua require("dap-go").debug_test()<CR>]], { desc = "Test Debug" })

-- Git
map("n", "<leader>lg", function() require("snacks").lazygit() end, { desc = "Lazy Git" })

-- Buffer switch
map("n", "<leader>bl", [[:b#<CR>]], { desc = "Previous Buffer" })
map("n", "<leader>bh", [[:bn<CR>]], { desc = "Next Buffer" })

map("n", "<leader>ha", function() require("harpoon"):list():add() end, { desc = "Harpoon Add file" })
map("n", "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, { desc = "Harpoon Quick Menu" })

map("n", "<C-a>", function() require("harpoon"):list():select(1) end, { desc = "Harpoon file 1" })
map("n", "<C-d>", function() require("harpoon"):list():select(2) end, { desc = "Harpoon file 2" })
map("n", "<C-g>", function() require("harpoon"):list():select(3) end, { desc = "Harpoon file 3" })
map("n", "<C-j>", function() require("harpoon"):list():select(4) end, { desc = "Harpoon file 4" })

map("n", "<leader>hp", function() require("harpoon"):list():prev() end, { desc = "Harpoon Previous buffer" })
map("n", "<leader>hn", function() require("harpoon"):list():next() end, { desc = "Harpoon Next buffer" })

-- DAP (Debug Adapter Protocol)
map("n", "<leader>dc", require "dap".continue, { desc = 'DAP Continue' })
map("n", "<leader>do", require "dap".step_over, { desc = 'DAP Step Over' })
map("n", "<leader>di", require "dap".step_into, { desc = 'DAP Step Into' })
map("n", "<leader>dx", require "dap".step_out, { desc = 'DAP Step Out' })
map("n", "<leader>ba", require "dap".toggle_breakpoint, { desc = 'DAP Add Breakpoint' })
map("n", "<leader>cb", require "dap".clear_breakpoints, { desc = 'Clear All Breakpoints' })
map("n", "<leader>dt", require "dap".terminate, { desc = 'DAP Terminate' })
map("n", "<leader>fv", [[:lua require("dapui").float_element("scopes")<CR>:lua require("dapui").float_element("scopes")<CR>]], { desc = "Floating Variables window"})

-- Find Files
map("n", "<leader>fe", function() require("snacks").explorer() end, { desc = "File Explorer" })
map("n", "<leader>ff", require("snacks").picker.files, { desc = "Find Files" })
map("n", "<leader>fb", require("snacks").picker.buffers, { desc = "Find Buffers" })
map("n", "<leader>fg", require("snacks").picker.git_files, { desc = "Find Git Files" })
map("n", "<leader>fr", require("snacks").picker.recent, { desc = "Find Recent Files" })
map("n", "<leader>fP", function() require("snacks").picker.files({ cwd = "~/dev" }) end, { desc = "Find Projects" })
map("n", "<leader>fn", function() require("snacks").picker.files({ cwd = "~/notes" }) end, { desc = "Find Notes" })
map("n", "<leader>fc", function() require("snacks").picker.files({ cwd = "~/dotfiles" }) end, { desc = "Find Config File" })
map("n", "<leader>f.", function() require("snacks").picker.files({ cwd = vim.fn.expand("%:p:h") }) end, { desc = "Find Files in Buffer Dir" })

-- Grep
map("n", "<leader>/", require("snacks").picker.lines, { desc = "Search Buffer" })
map("n", "<leader>s.", function() require("snacks").picker.grep({ cwd = vim.fn.expand("%:p:h") }) end, { desc = "Search in Buffer Dir" })
map("n", "<leader>sP", function() require("snacks").picker.grep({ cwd = "~/dev" }) end, { desc = "Search in Projects"})
map("n", "<leader>sc", function() require("snacks").picker.grep({ cwd = "~/dotfiles" }) end, { desc = "Search in Config Files"})
map("n", "<leader>sw", require("snacks").picker.grep_word, { desc = "Search Word" })
map("n", "<leader>sn", function() require("snacks").picker.grep({ cwd = "~/notes" }) end, { desc = "Search in Notes"})
map("n", "<leader>sb", require("snacks").picker.grep_buffers, { desc = "Search in Buffer Files" })
map("n", "<leader>sg", require("snacks").picker.grep, { desc = "Search Grep" })

-- Search
map("n", "<leader>sN", require("snacks").picker.notifications, { desc = "Search Notifications" })
map("n", '<leader>s"', require("snacks").picker.registers, { desc = "Search Registers" })
map("n", "<leader>sh", require("snacks").picker.help, { desc = "Search Help" })
map("n", "<leader>sH", require("snacks").picker.command_history, { desc = "Search Command History" })
map("n", "<leader>sC", require("snacks").picker.commands, { desc = "Search Command" })
map("n", "<leader>sk", require("snacks").picker.keymaps, { desc = "Search Keymaps" })
map("n", "<leader>sM", require("snacks").picker.man, { desc = "Search Man Pages" })
map("n", "<leader>si", require("snacks").picker.icons, { desc = "Search Icons" })
map("n", "<leader>sp", require("snacks").picker.lazy, { desc = "Search Plugins" })
map("n", "<leader>su", require("snacks").picker.undo, { desc = "Search Undo History" })

-- Diagnostic keymaps
map("n", "<leader>sd", require("snacks").picker.diagnostics, { desc = "Search Diagnostics" })
map("n", "<leader>sD", require("snacks").picker.diagnostics_buffer, { desc = "Search Buffer Diagnostics" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = 'Diagnostic Previous Issue' })
map("n", "]d", vim.diagnostic.goto_next, { desc = 'Diagnostic Next Issue' })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = 'Diagnostic Open issue Info' })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = 'Diagnostic Show Locations' })
map("n", "<leader>xw", [[:Trouble diagnostics toggle<CR>]], { desc = "Open Workspace Diagnostics" })
map("n", "<leader>xd", [[:Trouble diagnostics toggle filter.buf=0<CR>]], { desc = "Open Document Diagnostics" })
map("n", "<leader>xq", [[:Trouble quickfix toggle<CR>]], { desc = "Open Diagnostics Quickfix List" })
map("n", "<leader>xl", [[:Trouble loclist toggle<CR>]], { desc = "Open Diagnostics Location List" })
map("n", "<leader>xt", [[:Trouble todo toggle<CR>]], { desc = "Open TODOs" })

-- Yazi
map("n", "<leader>-", function() require("yazi").yazi() end, { desc = "Open Yazi File Manager" })
map("n", "<leader>cw", function() require("yazi").yazi(nil, vim.fn.getcwd()) end, { desc = "Open Yazi File Manager Current Working Dir" })

-- LSP
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
map("n", "gr", require("snacks").picker.lsp_references, { desc = "Goto References" })
map("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
map("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type Definition" })
map("n", "<leader>ds", require("snacks").picker.lsp_symbols, { desc = "Document Symbols" })
map("n", "<leader>ws", require("snacks").picker.lsp_workspace_symbols, { desc = "Workspace Symbols" })

-- See `:help K` for why this keymap
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })

-- Lesser used LSP functionality
map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Workspace Add Folder" })
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Workspace Remove Folder" })
map("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { desc = "Workspace List Folders" })
map("n", "<leader>bf", vim.lsp.buf.format, { desc = "Format current buffer with LSP" })

-- TODO comments
map("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next TODO Comment" })
map("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous TODO Comment" })

-- Other
map("n", "<leader>ug", [[:Uuid<CR>]], { desc = "UUID Generate" })
