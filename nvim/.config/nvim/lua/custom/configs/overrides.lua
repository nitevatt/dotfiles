local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "markdown",
    "markdown_inline",
    "tsx",
  },
  indent = {
    enable = true,
    disable = {
      "python",
    },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "cssmodules-language-server",
    "html-lsp",
    "typescript-language-server",

    -- other
    "marksman"
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  actions = {
    open_file = {
      quit_on_open = true,
    },
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },

  view = {
    width = { min = 30 }
  }
}

return M
