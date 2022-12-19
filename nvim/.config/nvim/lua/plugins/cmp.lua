local M = {}

M.setup = function(use)
  use "onsails/lspkind.nvim"

  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-vsnip"
  use "hrsh7th/vim-vsnip"
end

local function format()
  local ok, lspkind = pcall(require, "lspkind")

  if not ok then
    return
  end

  return lspkind.cmp_format {
    mode = "symbol_text"
  }
end

M.config = function()
  local ok, cmp = pcall(require, "cmp")

  if not ok then
    return
  end

  cmp.setup {
    formatting = {
      format = format(),
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end
    },
    mapping = cmp.mapping.preset.insert {
      ["<c-b>"] = cmp.mapping.scroll_docs(-4),
      ["<c-f>"] = cmp.mapping.scroll_docs(4),
      ["<c-space>"] = cmp.mapping.complete(),
      ["<c-e>"] = cmp.mapping.abort(),
      ["<cr>"] = cmp.mapping.confirm { select = true },
      ["<tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end),
      ["<s-tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end)
    },
    sources = cmp.config.sources(
      {
        { name = "nvim_lsp" },
      },
      {
        {
          name = "buffer",
          option = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end
          }
        },
        { name = "path" },
      }
    )
  }

  local autopairs = require("plugins.autopairs")

  autopairs.on_confirm_done(cmp)
end

return M
