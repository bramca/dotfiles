-- Fancy UI
local M = {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      sections = {
        {
          pane = 2,
          indent = 4,
          {
            icon = "󰃢 ",
            title = "Maintenance"
          },
          {
            padding = 2,
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})"
            },
            {
              icon = " ",
              key = "l",
              desc = "Lazy Plugins",
              action = ":Lazy"
            },
            {
              icon = "󱁤 ",
              key = "m",
              desc = "Mason",
              action = ":Mason"
            }
          },
          {
            icon = " ",
            title = "Recent Files"
          },
          {
            section = "recent_files",
            opts = {
              limit = 3
            },
            indent = 4,
            padding = 1
          },
          {
            icon = " ",
            title = "Projects"
          },
          {
            section = "projects",
            opts = {
              limit = 10
            },
            indent = 4,
            padding = 2
          }
        },
        {
          pane = 1,
          align = "center",
          random = 10,
          section = "terminal",
          cmd = "~/starfetch/starfetch",
          height = 14,
          padding = 3
        },
        {
          section = "startup",
          padding = 3,
        },
      },
    },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = false },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
}

return M
