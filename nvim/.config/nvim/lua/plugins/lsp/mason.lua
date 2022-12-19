local M = {}

M.setup = function(use)
  use "williamboman/mason.nvim"
end

M.config = function()
  local ok, mason = pcall(require, "mason")

  if not ok then
    return
  end

  mason.setup()
end

return M
