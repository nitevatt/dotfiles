local M = {}

M.setup = function(use)
  use { "arcticicestudio/nord-vim", "navarasu/onedark.nvim" }
end

M.config = function()
  local ok, onedark = pcall(require, "onedark")

  if not ok then
    return
  end

  onedark.load()
end

return M
