local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" }
}

function M.config()
  require("harpoon").setup()
end

return M
