local typescript = require "typescript"

typescript.setup {}

local format_all = function()
  typescript.actions.removeUnused { sync = true }
  typescript.actions.organizeImports { sync = true }
  vim.lsp.buf.format { async = true }
end

vim.keymap.set("n", "<leader>fk", format_all, {})
