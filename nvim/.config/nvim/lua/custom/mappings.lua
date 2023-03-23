---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  v = {
    ["<leader>d"] = { "y'>p", "duplicate selected lines" },
  },
}

M.typescript = {
  plugin = true,

  n = {
    ["<leader>fo"] = { ":TypescriptOrganizeImports<CR>", "organize imports" },
    ["<leader>fu"] = { ":TypescriptRemoveUnused<CR>", "remove unused imports" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    ["<leader>fs"] = { ":Telescope lsp_document_symbols<CR>" },
  },
}

return M
