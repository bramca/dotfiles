return {
  "cameron-wags/rainbow_csv.nvim",
  ft = {
    "csv",
    "tsv",
    "csv_semicolon",
    "csv_whitespace",
    "csv_pipe",
    "rfc_csv",
    "rfc_semicolon",
  },
  config = function()
    require("rainbow_csv").setup()
  end,
}
