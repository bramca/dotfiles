return {
  "nvim-treesitter/nvim-treesitter",
  -- TODO: update nvim to 0.12 for compatability with the latest version
  commit = "90cd658",
  opts = {
    ensure_installed = {
      "c",
      "cpp",
      "go",
      "lua",
      "python",
      "rust",
      "typescript",
      "vim",
      "http",
      "javascript",
      "astro",
      "yaml",
    },
  },
}
