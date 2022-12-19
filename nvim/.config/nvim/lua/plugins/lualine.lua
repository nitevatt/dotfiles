local M = {}

M.setup = function(use)
  use "nvim-lualine/lualine.nvim"
end

M.config = function()
  local ok, lualine = pcall(require, "lualine")

  if not ok then
    return
  end

  lualine.setup()
end

return M
