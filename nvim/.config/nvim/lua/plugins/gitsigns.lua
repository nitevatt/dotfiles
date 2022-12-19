local M = {}

M.setup = function(use)
  use "lewis6991/gitsigns.nvim"
end

M.config = function()
  local ok, gitsigns = pcall(require, "gitsigns")

  if not ok then
    return
  end

  gitsigns.setup()
end

return M
