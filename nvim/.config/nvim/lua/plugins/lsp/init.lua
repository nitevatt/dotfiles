local M = {}

local mason = require("plugins.lsp.mason")
local mason_lspconfig = require("plugins.lsp.mason_lspconfig")

M.setup = function(use)
  mason.setup(use)
  mason_lspconfig.setup(use)
end


M.config = function()
  mason.config()
  mason_lspconfig.config()

  local opts = { noremap = true, silent = true }

  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
end

return M
