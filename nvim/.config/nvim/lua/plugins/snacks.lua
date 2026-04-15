return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = true,
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
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
