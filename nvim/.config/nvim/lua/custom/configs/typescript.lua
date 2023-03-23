local ok, typescript = pcall(require, "typescript")

if not ok then
  return
end

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

typescript.setup {
  server = {
    on_attach = function(client, bufnr)
      vim.keymap.set("n", "<leader>;", function()
        typescript.actions.removeUnused { sync = true }
        typescript.actions.organizeImports { sync = true }
        vim.lsp.buf.format { async = true }
      end)

      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
  },
}
