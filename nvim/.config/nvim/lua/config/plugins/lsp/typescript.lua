local M = {}

local group = vim.api.nvim_create_augroup("TSFormatting", {})

M.setup = function(capabilities, on_attach)
  local typescript = require("typescript")

  typescript.setup({
    server = {
      capabilities = capabilities,
      cmd = { "typescript-language-server", "--stdio", "--tsserver-path", "typescript" },
      on_attach = function(client, bufnr)
        vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = group,
          buffer = bufnr,
          callback = function()
            typescript.actions.removeUnused({ sync = true })
            typescript.actions.organizeImports({ sync = true })
          end
        })

        on_attach(client, bufnr)
      end
    }
  })
end

return M
