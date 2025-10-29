require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Keymaps for better default experience
-- See `:help map()`
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Terminal toggle
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm:" .. vim.fn.getcwd() }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm:" .. vim.fn.getcwd() }
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm:" .. vim.fn.getcwd() }
end, { desc = "terminal toggle floating term" })

-- Remap for scrolling
map("n", "<C-p>", "kzz", { silent = true })
map("n", "<C-n>", "jzz", { silent = true })

-- Keymaps
map("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })
map("n", "<leader>k", [[:nohl<CR>]], { desc = "No Highlight" })

-- Maintenance
map("n", "<leader>L", [[:Lazy<CR>]], { desc = "Lazy Plugins" })
map("n", "<leader>M", [[:Mason<CR>]], { desc = "Mason" })

-- REST Client
map("n", "<C-c><C-c>", [[:Rest run<CR>]], { noremap = true })

-- Testing
map("n", "<leader>ts", [[:TestNearest<CR>]], { desc = "Test Nearest" })
map("n", "<leader>td", [[:lua require("dap-go").debug_test()<CR>]], { desc = "Test Debug" })

-- Git
map("n", "<leader>lg", function()
  require("snacks").lazygit()
end, { desc = "Lazy Git" })

-- Buffer switch
map("n", "<leader>bl", [[:b#<CR>]], { desc = "Previous Buffer" })
map("n", "<leader>bh", [[:bn<CR>]], { desc = "Next Buffer" })

-- DAP (Debug Adapter Protocol)
map("n", "<leader>dc", require("dap").continue, { desc = "DAP Continue" })
map("n", "<leader>do", require("dap").step_over, { desc = "DAP Step Over" })
map("n", "<leader>di", require("dap").step_into, { desc = "DAP Step Into" })
map("n", "<leader>dx", require("dap").step_out, { desc = "DAP Step Out" })
map("n", "<leader>ba", require("dap").toggle_breakpoint, { desc = "DAP Add Breakpoint" })
map("n", "<leader>cb", require("dap").clear_breakpoints, { desc = "Clear All Breakpoints" })
map("n", "<leader>dt", require("dap").terminate, { desc = "DAP Terminate" })
map(
  "n",
  "<leader>fv",
  [[:lua require("dapui").float_element("scopes")<CR>:lua require("dapui").float_element("scopes")<CR>]],
  { desc = "Floating Variables window" }
)

-- Find Files
map("n", "<leader>fe", [[:NvimTreeToggle<CR>]], { desc = "File Explorer " })
map("n", "<leader>ff", function()
  require("telescope.builtin").find_files { hidden = true }
end, { desc = "Find Files" })
map("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Find Buffers" })
map("n", "<leader>fg", require("telescope.builtin").git_files, { desc = "Find Git Files" })
map("n", "<leader>fr", require("telescope.builtin").oldfiles, { desc = "Find Recent Files" })
map("n", "<leader>fP", function()
  require("telescope.builtin").find_files { cwd = "~/dev", hidden = true }
end, { desc = "Find Projects" })
map("n", "<leader>fn", function()
  require("telescope.builtin").find_files { cwd = "~/notes", hidden = true }
end, { desc = "Find Notes" })
vim.keymap.set("n", "<leader>fs", function()
  require("telescope.builtin").find_files { cwd = "~/temp/scripts", hidden = true }
end, { desc = "Find Scripts" })
map("n", "<leader>fc", function()
  require("telescope.builtin").find_files { cwd = "~/dotfiles", hidden = true }
end, { desc = "Find Config File" })
map("n", "<leader>f.", function()
  require("telescope.builtin").find_files { cwd = vim.fn.expand "%:p:h", hidden = true }
end, { desc = "Find Files in Buffer Dir" })

-- Grep
map("n", "<leader>/", require("telescope.builtin").current_buffer_fuzzy_find, { desc = "Search Buffer" })
map("n", "<leader>s.", function()
  require("telescope.builtin").live_grep { cwd = vim.fn.expand "%:p:h", hidden = true }
end, { desc = "Search in Buffer Dir" })
map("n", "<leader>sP", function()
  require("telescope.builtin").live_grep { cwd = "~/dev", hidden = true }
end, { desc = "Search in Projects" })
map("n", "<leader>sc", function()
  require("telescope.builtin").live_grep { cwd = "~/dotfiles", hidden = true }
end, { desc = "Search in Config Files" })
map("n", "<leader>sn", function()
  require("telescope.builtin").live_grep { cwd = "~/notes", hidden = true }
end, { desc = "Search in Notes" })
map("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "Search Grep", hidden = true })

-- Search
map("n", '<leader>s"', require("telescope.builtin").registers, { desc = "Search Registers" })
map("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "Search Help" })
map("n", "<leader>sH", require("telescope.builtin").command_history, { desc = "Search Command History" })
map("n", "<leader>sC", require("telescope.builtin").commands, { desc = "Search Command" })
map("n", "<leader>sk", require("telescope.builtin").keymaps, { desc = "Search Keymaps" })
map("n", "<leader>sM", require("telescope.builtin").man_pages, { desc = "Search Man Pages" })
map("n", "<leader>sN", require("snacks").picker.notifications, { desc = "Search Notifications" })
map("n", "<leader>si", require("snacks").picker.icons, { desc = "Search Icons" })
map("n", "<leader>sp", require("snacks").picker.lazy, { desc = "Search Plugins" })
map("n", "<leader>su", require("snacks").picker.undo, { desc = "Search Undo History" })

-- Diagnostic keymaps
map("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "Search Diagnostics" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostic Open issue Info" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic Show Locations" })
map("n", "<leader>Xw", [[:Trouble diagnostics toggle<CR>]], { desc = "Open Workspace Diagnostics" })
map("n", "<leader>Xd", [[:Trouble diagnostics toggle filter.buf=0<CR>]], { desc = "Open Document Diagnostics" })
map("n", "<leader>Xq", [[:Trouble quickfix toggle<CR>]], { desc = "Open Diagnostics Quickfix List" })
map("n", "<leader>Xl", [[:Trouble loclist toggle<CR>]], { desc = "Open Diagnostics Location List" })
map("n", "<leader>Xt", [[:Trouble todo toggle<CR>]], { desc = "Open TODOs" })

-- Yazi
map("n", "<leader>-", function()
  require("yazi").yazi()
end, { desc = "Open Yazi File Manager" })
map("n", "<leader>cw", function()
  require("yazi").yazi(nil, vim.fn.getcwd())
end, { desc = "Open Yazi File Manager Current Working Dir" })

-- LSP
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
map("n", "gr", require("telescope.builtin").lsp_references, { desc = "Goto References" })
map("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
map("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type Definition" })
map("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, { desc = "Document Symbols" })
map("n", "<leader>ws", require("telescope.builtin").lsp_workspace_symbols, { desc = "Workspace Symbols" })

-- See `:help K` for why this keymap
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })

-- Lesser used LSP functionality
map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Workspace Add Folder" })
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Workspace Remove Folder" })
map("n", "<leader>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "Workspace List Folders" })
map("n", "<leader>bf", vim.lsp.buf.format, { desc = "Format current buffer with LSP" })

-- TODO comments
map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next TODO Comment" })
map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous TODO Comment" })

-- Other
map("n", "<leader>ug", [[:Uuid<CR>]], { desc = "UUID Generate" })
map("n", "<leader>ut", require("base46").toggle_transparency, { desc = "Toggle Transparency" })
map("n", "<leader>st", require("base46").toggle_theme, { desc = "Switch Theme" })
map("n", "<leader>ct", [[:lua require("nvchad.themes").open()<CR>]], { desc = "Change Theme" })
