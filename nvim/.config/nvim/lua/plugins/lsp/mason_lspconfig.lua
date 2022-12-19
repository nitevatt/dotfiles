local M = {}

local lspconfig = require("plugins.lsp.lspconfig")
local typescript = require("plugins.lsp.typescript")

M.setup = function(use)
  use "williamboman/mason-lspconfig.nvim"

  lspconfig.setup(use)
  typescript.setup(use)
end

local group = vim.api.nvim_create_augroup("LspFormatting", {})

local function on_attach(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("v", "<leader>fm", vim.lsp.buf.format, bufopts)

  vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = group,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({
        filter = function(client)
          return client.name == "null-ls"
        end,
        bufnr = bufnr,
        timeout_ms = 10000
      })
    end
  })
end

local function get_capabilities()
  local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

  if not ok then
    return
  end

  return cmp_nvim_lsp.default_capabilities()
end

M.config = function()
  local ok, mason_lspconfig = pcall(require, "mason-lspconfig")

  if not ok then
    return
  end

  mason_lspconfig.setup {
    ensure_installed = {
      "cssls",
      "cssmodules_ls",
      "emmet_ls",
      "eslint",
      "html",
      "jsonls",
      "tsserver"
    }
  }

  local capabilities = get_capabilities()

  mason_lspconfig.setup_handlers {
    function(server_name)
      lspconfig.config(server_name, {
        capabilities = capabilities,
        on_attach = on_attach
      })
    end,
    ["sumneko_lua"] = function()
      lspconfig.config("sumneko_lua", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      })
    end,
    ["tsserver"] = function()
      typescript.config(capabilities, on_attach)
    end
  }
end

return M
