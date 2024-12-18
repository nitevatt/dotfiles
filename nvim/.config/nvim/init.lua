local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  }

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})

    vim.fn.getchar()

    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.mouse = "a"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.termguicolors = true

vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

vim.keymap.set("n", "<esc>", vim.cmd.nohl)
vim.keymap.set("n", "<tab>", vim.cmd.bnext)
vim.keymap.set("n", "<s-tab>", vim.cmd.bprevious)
vim.keymap.set("n", "<leader>x", vim.cmd.bdelete)

require("lazy").setup {
  spec = {
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      config = function()
        local function set_colorscheme()
          if vim.o.background == "dark" then
            vim.cmd.colorscheme "catppuccin-latte"
          else
            vim.cmd.colorscheme "catppuccin-frappe"
          end
        end

        set_colorscheme()

        vim.keymap.set("n", "<leader>th", set_colorscheme)
      end,
    },
    {
      "nvim-tree/nvim-tree.lua",
      config = function()
        require("nvim-tree").setup {
          actions = {
            open_file = {
              quit_on_open = true,
            },
          },
        }

        vim.keymap.set("n", "<c-n>", vim.cmd.NvimTreeFindFile)
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      main = "nvim-treesitter.configs",
      opts = {
        ensure_installed = "all",
        highlight = {
          enable = true,
        },
      },
    },
    {
      "echasnovski/mini.pairs",
      version = "*",
      config = true,
    },
    {
      "echasnovski/mini.statusline",
      version = "*",
      config = true,
    },
    {
      "echasnovski/mini.tabline",
      version = "*",
      config = true,
    },
    {
      "echasnovski/mini.surround",
      version = "*",
      config = true,
    },
    {
      "echasnovski/mini.completion",
      version = "*",
      config = true,
    },
    {
      "neovim/nvim-lspconfig",
      config = function()
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
      end,
    },
    {
      "mfussenegger/nvim-lint",
      config = function()
        require("lint").linters_by_ft = {
          javascript = { "eslint_d" },
          typescript = { "eslint_d" },
          javascriptreact = { "eslint_d" },
          typescriptreact = { "eslint_d" },
        }

        vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
          group = vim.api.nvim_create_augroup(
            "CustomNvimLint",
            { clear = true }
          ),
          pattern = "*",
          callback = function()
            require("lint").try_lint()
          end,
        })
      end,
    },
    {
      "mhartington/formatter.nvim",
      config = function()
        require("formatter").setup {
          filetype = {
            lua = {
              require("formatter.filetypes.lua").stylua,
            },
            css = {
              require "formatter.defaults.prettier",
            },
            html = {
              require "formatter.defaults.prettier",
            },
            javascript = {
              require "formatter.defaults.prettier",
            },
            javascriptreact = {
              require "formatter.defaults.prettier",
            },
            json = {
              require "formatter.defaults.prettier",
            },
            markdown = {
              require "formatter.defaults.prettier",
            },
            scss = {
              require "formatter.defaults.prettier",
            },
            typescript = {
              require "formatter.defaults.prettier",
            },
            typescriptreact = {
              require "formatter.defaults.prettier",
            },
          },
        }

        vim.keymap.set("n", "<leader>fm", vim.cmd.Format)
      end,
    },
    {
      "williamboman/mason.nvim",
    },
    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()

        require("mason-lspconfig").setup_handlers {
          function(server_name)
            require("lspconfig")[server_name].setup {}
          end,
        }
      end,
    },
    {
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      config = function()
        local builtin = require "telescope.builtin"

        vim.keymap.set("n", "<leader>ff", builtin.find_files)
        vim.keymap.set("n", "<leader>fg", builtin.live_grep)
        vim.keymap.set("n", "<leader>fb", builtin.buffers)

        vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols)
        vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols)
        vim.keymap.set("n", "<leader>fr", builtin.lsp_references)
        vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions)
      end,
    },
  },
  checker = {
    enabled = true,
  },
}
