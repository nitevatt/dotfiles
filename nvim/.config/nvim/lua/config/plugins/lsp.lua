local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/typescript.nvim"
  }
}

M.config = function()
  require("mason").setup()
  require("config.plugins.lsp.mason_lspconfig").setup(require("mason-lspconfig"))

  local opts = { noremap = true, silent = true }

  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
end

return M
