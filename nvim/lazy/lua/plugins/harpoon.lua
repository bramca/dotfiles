local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" }
}

function M.config()
  local harpoon = require("harpoon")
  harpoon.setup({
    settings = {
      key = function()
        return "harpoon"
      end
    },
    default = {
      create_list_item = function(config, name)
        name = vim.loop.cwd() .. "/" .. vim.fn.expand("%")

        local bufnr = vim.fn.bufnr(name, false)

        local pos = { 1, 0 }
        if bufnr ~= -1 then
          pos = vim.api.nvim_win_get_cursor(0)
        end

        return {
          value = name,
          context = {
            row = pos[1],
            col = pos[2],
          },
        }
      end,
    }
  })
end

return M
