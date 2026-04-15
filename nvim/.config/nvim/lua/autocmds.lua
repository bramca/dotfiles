require "nvchad.autocmds"

-- UUID gen
vim.api.nvim_create_user_command("Uuid", function()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local handle = io.popen 'uuidgen | tr "[:upper:]" "[:lower:]" | tr -d "\n"'
  local uuid = handle:read "*a"
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
  pattern = { "*" },
  callback = function()
    local save_cursor = vim.fn.getpos "."
    vim.cmd [[%s/\s\+$//e]]
    vim.fn.setpos(".", save_cursor)
  end,
})

-- Set json formatter
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json" },
  callback = function()
    vim.api.nvim_set_option_value("formatprg", "jq", { scope = "local" })
  end,
})
