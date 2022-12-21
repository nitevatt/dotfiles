local M = { "jose-elias-alvarez/null-ls.nvim" }

M.config = function()
  local null_ls = require("null-ls")

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.prettier
    }
  })
end

return M
