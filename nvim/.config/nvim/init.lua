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
vim.keymap.set("v", "<leader>d", "yPgv")

require("lazy").setup {
  spec = {
    {
      "rose-pine/neovim",
      name = "rose-pine",
      config = function()
        require("rose-pine").setup {
          styles = {
            italic = false,
          },
        }

        vim.cmd.colorscheme "rose-pine"

        local function set_colorscheme()
          if vim.o.background == "dark" then
            vim.o.background = "light"
          else
            vim.o.background = "dark"
          end
        end

        vim.keymap.set("n", "<leader>th", set_colorscheme)
      end,
    },
    {
      "nvim-tree/nvim-tree.lua",
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("nvim-tree").setup {
          actions = {
            open_file = {
              quit_on_open = true,
            },
          },
          view = {
            width = {
              min = 30,
            },
          },
        }

        vim.keymap.set("n", "<c-n>", vim.cmd.NvimTreeFindFileToggle)
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
      "nvim-lualine/lualine.nvim",
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
      "saghen/blink.cmp",
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
      version = "*",
      opts = {
        completion = {
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
          },
          menu = {
            auto_show = function(ctx)
              return ctx.mode ~= "cmdline"
            end,
          },
        },
        keymap = {
          preset = "enter",
        },
      },
    },
    {
      "neovim/nvim-lspconfig",
      config = function()
        local function organize_imports()
          vim.lsp.buf.execute_command {
            command = "_typescript.organizeImports",
            arguments = { vim.api.nvim_buf_get_name(0) },
          }
        end

        vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)
        vim.keymap.set("n", "<leader>o", organize_imports)
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
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
          group = vim.api.nvim_create_augroup("CustomNvimLint", { clear = true }),
          pattern = "*",
          callback = function()
            if vim.fn.filereadable "eslint.config.js" ~= 0 then
              require("lint").try_lint()
            end
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

        vim.keymap.set("n", "<leader>qf", vim.cmd.Format)
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

        local capabilities = require("blink.cmp").get_lsp_capabilities()

        require("mason-lspconfig").setup_handlers {
          function(server_name)
            require("lspconfig")[server_name].setup {
              capabilities = capabilities,
            }
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

        vim.keymap.set("n", "<leader>f", builtin.find_files)
        vim.keymap.set("n", "<leader>W", builtin.live_grep)
        vim.keymap.set("n", "<leader>b", builtin.buffers)

        vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols)
        vim.keymap.set("n", "<leader>S", builtin.lsp_workspace_symbols)
        vim.keymap.set("n", "gr", builtin.lsp_references)
        vim.keymap.set("n", "gd", builtin.lsp_definitions)
      end,
    },
    {
      "lewis6991/gitsigns.nvim",
      config = true,
    },
  },
}
