require "nvchad.mappings"

local map = vim.keymap.set

map("n", "<leader>fo", function()
  vim.lsp.buf.execute_command { command = "_typescript.organizeImports", arguments = { vim.api.nvim_buf_get_name(0) } }
end, { desc = "TypeScript: Organize imports" })

map(
  "n",
  "<leader>fs",
  require("telescope.builtin").lsp_document_symbols,
  { desc = "Lists LSP document symbols in the current buffer" }
)

map("v", "<leader>d", "yPgv", { desc = "Duplicate lines up" })
