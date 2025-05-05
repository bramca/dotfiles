-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- REST Client
vim.keymap.set("n", "<C-c><C-c>", [[:Rest run<CR>]], { noremap = true })

-- Yazi
vim.keymap.set("n", "<leader>-", function()
  require("yazi").yazi()
end, { desc = "Open Yazi File Manager" })
vim.keymap.set("n", "<leader>cw", function()
  require("yazi").yazi(nil, vim.fn.getcwd())
end, { desc = "Open Yazi File Manager Current Working Dir" })

-- Testing
vim.keymap.set("n", "<leader>ts", [[:TestNearest<CR>]], { desc = "Test Nearest" })
vim.keymap.set(
  "n",
  "<leader>ta",
  [[:lua require("neotest").run.run(vim.fn.expand("%"))<CR>]],
  { desc = "Test All in File" }
)
vim.keymap.set("n", "<leader>ti", [[:lua require("neotest").run.run()<CR>]], { desc = "Test Nearest with Neo" })
vim.keymap.set(
  "n",
  "<leader>tr",
  [[:lua require("neotest").run.run({vim.fn.getcwd(), extra_args = {"./..."}})<CR>]],
  { desc = "Test All in Project Root" }
)
vim.keymap.set("n", "<leader>os", [[:lua require("neotest").summary.open()<CR>]], { desc = "Open Test Summary" })
vim.keymap.set("n", "<leader>cs", [[:lua require("neotest").summary.close()<CR>]], { desc = "Close Test Summary" })
vim.keymap.set(
  "n",
  "<leader>oo",
  [[:lua require("neotest").output_panel.open()<CR>]],
  { desc = "Open Test Output panel" }
)
vim.keymap.set(
  "n",
  "<leader>co",
  [[:lua require("neotest").output_panel.close()<CR>]],
  { desc = "Close Test Output panel" }
)
vim.keymap.set("n", "<leader>td", [[:lua require("dap-go").debug_test()<CR>]], { desc = "Test Debug" })

-- DAP (Debug Adapter Protocol)
vim.keymap.set("n", "<leader>dc", require("dap").continue, { desc = "DAP Continue" })
vim.keymap.set("n", "<leader>do", require("dap").step_over, { desc = "DAP Step Over" })
vim.keymap.set("n", "<leader>di", require("dap").step_into, { desc = "DAP Step Into" })
vim.keymap.set("n", "<leader>dx", require("dap").step_out, { desc = "DAP Step Out" })
vim.keymap.set("n", "<leader>ba", require("dap").toggle_breakpoint, { desc = "DAP Add Breakpoint" })
vim.keymap.set("n", "<leader>cb", require("dap").clear_breakpoints, { desc = "Clear All Breakpoints" })
vim.keymap.set("n", "<leader>dt", require("dap").terminate, { desc = "DAP Terminate" })
vim.keymap.set(
  "n",
  "<leader>fv",
  [[:lua require("dapui").float_element("scopes")<CR>:lua require("dapui").float_element("scopes")<CR>]],
  { desc = "Floating Variables window" }
)
