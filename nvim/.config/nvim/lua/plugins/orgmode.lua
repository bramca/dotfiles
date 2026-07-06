return {
  "nvim-orgmode/orgmode",
  lazy = false,
  config = function()
    require("orgmode").setup {
      org_agenda_files = "~/notes/*",
    }
  end,
}
