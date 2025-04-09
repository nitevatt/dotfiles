local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function()
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<c-b>"] = cmp.mapping.scroll_docs(-4),
    ["<c-f>"] = cmp.mapping.scroll_docs(4),
    ["<c-space>"] = cmp.mapping.complete(),
    ["<c-e>"] = cmp.mapping.abort(),
    ["<cr>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
  }, {
    { name = "buffer" },
  }),
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "astro",
    "cssls",
    "tailwindcss",
    "docker_compose_language_service",
    "dockerls",
    "emmet_language_server",
    "html",
    "ts_ls",
    "jsonls",
    "lua_ls",
    "marksman",
    "nginx_language_server",
    "intelephense",
  },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
    })
  end,
})
