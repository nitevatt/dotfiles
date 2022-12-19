local M = {}

M.setup = function(use)
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
end

M.config = function()
  local ok, treesitter = pcall(require, "nvim-treesitter.configs")

  if not ok then
    return
  end

  treesitter.setup {
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
  }
end

return M
