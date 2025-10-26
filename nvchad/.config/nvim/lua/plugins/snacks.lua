return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢧⢆⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⣎⠯⣞⡲⠦⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀
                ⠀⠀⠀⠀⠀⠀⠀⠀⣲⢣⠀⠀⠰⣎⡱⠬⣝⣫⡀⠀⠀⡸⡝⡆⠀⠀⠀⠀⠀⠀
                ⠀⠀⠀⠀⠀⠀⠀⣸⡱⢯⢤⠀⣜⠧⡜⡱⢌⢧⡃⠀⣬⢳⡝⡆⠀⠀⠀⠀⠀⠀
                ⠀⠀⠀⢀⠆⠀⢠⢣⡗⣊⢧⡻⣜⠱⢬⡑⢎⡞⣭⡜⣖⠣⣜⣳⠀⠀⢀⡤⠀⠀
                ⠀⠀⢀⣎⢟⡀⢨⡳⠗⠀⠀⠙⢎⡙⢦⡙⢦⢹⣲⠙⢦⡙⢤⢯⠀⢀⢶⡹⠆⠀
                ⠀⢀⡵⢎⣻⢤⡰⣛⡀⣠⣥⣶⣶⠯⠀⢙⢆⠳⣡⢋⠦⡙⣜⡺⢠⢏⠮⣙⢯⡀
                ⠀⡸⣜⡏⡔⣫⢜⡇⠛⠛⠛⠋⠁⠠⡀⠚⠈⠳⡰⣉⠖⣩⠆⣟⠭⣊⠕⣫⢞⡄
                ⠰⢷⣉⠶⢱⢆⡉⣁⡀⢈⡰⠈⠀⠀⠀⠀⠀⠀⠈⠆⣹⢀⠿⡈⡶⢉⠾⣈⢷⣆
                ⢘⢧⡏⡜⣡⢎⠲⣡⣋⠁⠀⠀⠀⠄⠀⠀⠀⠀⠀⣠⣤⣍⠖⣡⠧⣩⠒⣭⢞⡼
                ⢯⠶⡱⣘⠔⣪⣱⣿⣿⡆⠀⠀⣴⣶⣆⠀⠸⠀⢸⣿⣿⣏⣎⠱⢪⣔⣍⡲⢯⡜
                ⣏⡞⡱⢌⢎⣽⣿⣿⣿⡇⠀⠀⣿⣿⡿⠀⠁⠂⠈⠛⠉⠀⠀⣾⣿⣿⣿⣿⣧⠻
                ⢱⡹⡔⣋⣾⣿⣿⣿⣿⡇⠀⠀⠈⠉⠁⠈⠀⠀⠀⠀⠀⠀⠀⠙⠿⠿⠿⠟⣏⠇
                ⠐⢝⡦⢱⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠠⠚⢅⣀⠀⠀⠀⠀⠀⢀⡜⡎⠀
                ⠀⠈⢺⡅⢞⡻⡛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡝⣌⠣⡝⣌⡻⠜⠁⠀
                ⠀⠀⠀⠙⠢⠑⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣎⠱⡜⠔⠃⠀⠀⠀
                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀ ⠀⠀⠈⠁⠁⠀⠀⠀⠀
        ]],
      },
      sections = {
        {
          pane = 2,
          indent = 4,
          {
            icon = "󰃢 ",
            title = "Maintenance",
          },
          {
            padding = 2,
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = '~/dotfiles'})",
            },
            {
              icon = " ",
              key = "l",
              desc = "Lazy Plugins",
              action = ":Lazy",
            },
            {
              icon = "󱁤 ",
              key = "m",
              desc = "Mason",
              action = ":Mason",
            },
          },
          {
            icon = " ",
            title = "Recent Files",
          },
          {
            section = "recent_files",
            opts = {
              limit = 3,
            },
            indent = 4,
            padding = 2,
          },
          {
            icon = " ",
            title = "Projects",
          },
          {
            section = "projects",
            opts = {
              limit = 10,
            },
            indent = 4,
            padding = 2,
          },
        },
        {
          pane = 1,
          section = "header",
          align = "left",
          padding = 2,
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
      },
      layout = {
        preset = "ivy",
        cycle = false,
      },
      layouts = {
        ivy = {
          layout = {
            box = "vertical",
            backdrop = false,
            row = -1,
            width = 0,
            height = 0.5,
            border = "none",
            title = " {title} {live} {flags}",
            title_pos = "left",
            { win = "input", height = 1, border = "none" },
            {
              box = "horizontal",
              { win = "list", border = "none" },
              { win = "preview", title = "{preview}", width = 0.5, border = "none" },
            },
          },
        },
        vertical = {
          layout = {
            backdrop = false,
            width = 0.8,
            min_width = 80,
            height = 0.8,
            min_height = 30,
            box = "vertical",
            border = "none",
            title = "{title} {live} {flags}",
            title_pos = "center",
            { win = "input", height = 1, border = "none" },
            { win = "list", border = "none" },
            { win = "preview", title = "{preview}", height = 0.4, border = "none" },
          },
        },
      },
      matcher = {
        frecency = true,
      },
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n" } },
            ["J"] = { "preview_scroll_down", mode = { "n" } },
            ["K"] = { "preview_scroll_up", mode = { "n" } },
            ["H"] = { "preview_scroll_left", mode = { "n" } },
            ["L"] = { "preview_scroll_right", mode = { "n" } },
          },
        },
      },
      formatters = {
        file = {
          filename_first = true, -- display filename before the file path
          truncate = 80,
        },
      },
    },
    notifier = { enabled = true },
    quickfile = { enabled = false },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    image = {
      enabled = true,
      doc = {
        inline = true,
        float = true,
        max_width = 60,
        max_height = 30,
      },
    },
  },
}
