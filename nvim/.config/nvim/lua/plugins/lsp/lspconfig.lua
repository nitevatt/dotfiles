local M = {}

M.setup = function(use)
  use "neovim/nvim-lspconfig"
end

M.config = function(server_name, opts)
  local ok, lspconfig = pcall(require, "lspconfig")

  if not ok then
    return
  end

  lspconfig[server_name].setup(opts)
end

return M
