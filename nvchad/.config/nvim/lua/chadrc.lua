-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "nightfox",
  transparency = false,
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    Keyword = { bold = true },
    Type = { bold = true, italic = true },
  },
  theme_toggle = { "nightfox", "one_light" },
}

M.ui = {
  tabufline = {
    enabled = true,
    lazyload = true,
  },
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢧⢆⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⣎⠯⣞⡲⠦⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⣲⢣⠀⠀⠰⣎⡱⠬⣝⣫⡀⠀⠀⡸⡝⡆⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⣸⡱⢯⢤⠀⣜⠧⡜⡱⢌⢧⡃⠀⣬⢳⡝⡆⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⢀⠆⠀⢠⢣⡗⣊⢧⡻⣜⠱⢬⡑⢎⡞⣭⡜⣖⠣⣜⣳⠀⠀⢀⡤⠀⠀",
    "⠀⠀⢀⣎⢟⡀⢨⡳⠗⠀⠀⠙⢎⡙⢦⡙⢦⢹⣲⠙⢦⡙⢤⢯⠀⢀⢶⡹⠆⠀",
    "⠀⢀⡵⢎⣻⢤⡰⣛⡀⣠⣥⣶⣶⠯⠀⢙⢆⠳⣡⢋⠦⡙⣜⡺⢠⢏⠮⣙⢯⡀",
    "⠀⡸⣜⡏⡔⣫⢜⡇⠛⠛⠛⠋⠁⠠⡀⠚⠈⠳⡰⣉⠖⣩⠆⣟⠭⣊⠕⣫⢞⡄",
    "⠰⢷⣉⠶⢱⢆⡉⣁⡀⢈⡰⠈⠀⠀⠀⠀⠀⠀⠈⠆⣹⢀⠿⡈⡶⢉⠾⣈⢷⣆",
    "⢘⢧⡏⡜⣡⢎⠲⣡⣋⠁⠀⠀⠀⠄⠀⠀⠀⠀⠀⣠⣤⣍⠖⣡⠧⣩⠒⣭⢞⡼",
    "⢯⠶⡱⣘⠔⣪⣱⣿⣿⡆⠀⠀⣴⣶⣆⠀⠸⠀⢸⣿⣿⣏⣎⠱⢪⣔⣍⡲⢯⡜",
    "⣏⡞⡱⢌⢎⣽⣿⣿⣿⡇⠀⠀⣿⣿⡿⠀⠁⠂⠈⠛⠉⠀⠀⣾⣿⣿⣿⣿⣧⠻",
    "⢱⡹⡔⣋⣾⣿⣿⣿⣿⡇⠀⠀⠈⠉⠁⠈⠀⠀⠀⠀⠀⠀⠀⠙⠿⠿⠿⠟⣏⠇",
    "⠐⢝⡦⢱⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠠⠚⢅⣀⠀⠀⠀⠀⠀⢀⡜⡎⠀",
    "⠀⠈⢺⡅⢞⡻⡛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡝⣌⠣⡝⣌⡻⠜⠁⠀",
    "⠀⠀⠀⠙⠢⠑⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣎⠱⡜⠔⠃⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀ ⠀⠀⠈⠁⠁⠀⠀⠀⠀ ",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀ ⠀⠀   ⠀⠀⠀⠀ ",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀ ⠀⠀   ⠀⠀⠀⠀ ",
  },
  buttons = {
    { txt = "  Find File", keys = "f", cmd = "Telescope find_files" },
    { txt = "󰈚  Recent Files", keys = "r", cmd = "Telescope oldfiles" },
    { txt = "  Find Projects", keys = "p", cmd = "Telescope find_files cwd=~/dev" },
    { txt = "  Find Config", keys = "c", cmd = "Telescope find_files cwd=~/dotfiles hidden=true" },
    { txt = "  File Manager", keys = "-", cmd = "Yazi" },
    { txt = "󱐥  Plugins", keys = "l", cmd = "Lazy" },
    { txt = "  Mason", keys = "m", cmd = "Mason" },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
      content = "fit",
    },
  },
}

M.term = {
  winopts = { number = true, relativenumber = true },
  sizes = { sp = 0.4, vsp = 0.4, ["bo sp"] = 0.4, ["bo vsp"] = 0.4 },
  float = {
    relative = "editor",
    row = 0.1,
    col = 0.15,
    width = 0.7,
    height = 0.7,
    border = "single",
  },
}

return M
