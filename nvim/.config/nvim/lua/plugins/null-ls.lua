local M = {}

M.setup = function(use)
  use "jose-elias-alvarez/null-ls.nvim"
end

M.config = function()
  local ok, null_ls = pcall(require, "null-ls")

  if not ok then
    return
  end

  null_ls.setup {
    sources = {
      null_ls.builtins.formatting.prettier
    }
  }
end

return M
