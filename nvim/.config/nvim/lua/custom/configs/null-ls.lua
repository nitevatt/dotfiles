local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting

local sources = {
  formatting.prettier,
  formatting.stylua,

  require "typescript.extensions.null-ls.code-actions"
}

null_ls.setup {
  sources = sources,
}
