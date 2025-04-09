return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPre",
  opts = {
    ensure_installed = { "lua" },
    highlight = {
      enable = true
    }
  }
}
