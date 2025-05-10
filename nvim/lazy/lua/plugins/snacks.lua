-- Fancy UI
local M = {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
                               .+-
                              ++++-
                        -    -===++:    =-
                       -++   =====++   =++
                       +=+= :+=====+: ++=+-
                  .   ++==+++======+++====-   :.
                 -+=  ++-:::=======++=====-  -++
                .+++--+=:::-*%=--=========- ++=+=
                ++==++++#@@@@-:::=========++===++
               =+======::::::::    .===========++-
               ++========.            .========++=
              =+=======#@            @@@========++
              ++=====#@@@:  *@@%    %@@@=-:-++==++
              ++====@@@@@-  @@@@         +@@@@@@*=
              =+===@@@@@@:                %@@@@#+:
               +==+@@@@@@          .+          ==
               .+==@@@@#              .=--::-=++
                 ====:                 .======-
                    -                   :===:
        ]]
      },
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
            padding = 2
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
          section = "header",
          align = "left",
          padding = 2
        },
        {
          align = "center",
          section = "startup",
          padding = 2,
        },
      },
    },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        files = { hidden = true },
        grep = { hidden = true },
        explorer = { hidden = true },
      }
    },
    notifier = { enabled = true },
    quickfile = { enabled = false },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
}

return M
