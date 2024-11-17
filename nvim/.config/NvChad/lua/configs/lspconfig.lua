-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "css_variables",
  "cssls",
  "cssmodules_ls",
  "cucumber_language_server",
  "docker_compose_language_service",
  "dockerls",
  "emmet_language_server",
  "eslint",
  "html",
  "jsonls",
  "nginx_language_server",
  "tailwindcss",
  "ts_ls",
}

local nvlsp = require "nvchad.configs.lspconfig"

local capabilities = nvlsp.capabilities

capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
