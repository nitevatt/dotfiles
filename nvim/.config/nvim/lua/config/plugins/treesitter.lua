local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
}

M.config = function()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "css",
      "help",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "scss",
      "tsx",
      "typescript",
      "vim",
      "yaml"
    },
    highlight = {
      enable = true
    }
  })
end

return M
