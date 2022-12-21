local M = {}

M.setup = function(server_name, opts)
  require("lspconfig")[server_name].setup(opts)
end

return M
