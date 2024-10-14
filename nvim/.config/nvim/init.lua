if vim.g.vscode then
  vim.api.nvim_create_autocmd("CursorHold", {
    group = vim.api.nvim_create_augroup("MyCursorHoldGroup", { clear = true }),
    pattern = "*",
    callback = function()
      vim.cmd("silent! mode")
    end
  })
else
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  vim.opt.termguicolors = true

  vim.opt.laststatus = 3
  vim.opt.showmode = false

  vim.opt.inccommand = "split"

  vim.opt.clipboard = "unnamedplus"
  vim.opt.cursorline = true

  -- Indenting
  vim.opt.expandtab = true
  vim.opt.shiftwidth = 2
  vim.opt.smartindent = true
  vim.opt.tabstop = 2
  vim.opt.softtabstop = 2

  vim.opt.list = true
  vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

  vim.opt.fillchars = { eob = " " }
  vim.opt.ignorecase = true
  vim.opt.smartcase = true
  vim.opt.mouse = "a"

  -- Numbers
  vim.opt.number = true
  vim.opt.numberwidth = 2
  vim.opt.relativenumber = true
  vim.opt.ruler = false

  -- disable nvim intro
  vim.opt.shortmess:append "sI"

  vim.opt.signcolumn = "yes"
  vim.opt.splitbelow = true
  vim.opt.splitright = true
  vim.opt.timeoutlen = 400
  vim.opt.undofile = true

  -- interval for writing swap file to disk, also used by gitsigns
  vim.opt.updatetime = 250

  vim.opt.scrolloff = 10

  -- go to previous/next line with h,l,left arrow and right arrow
  -- when cursor reaches end/beginning of line
  vim.opt.whichwrap:append "<>[]hl"

  vim.cmd.colorscheme "habamax"

  local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }

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

  require("lazy").setup {
    spec = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "lewis6991/gitsigns.nvim",
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-tree.lua",
      "nvim-tree/nvim-web-devicons",
      "stevearc/conform.nvim",
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",
      { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
      "MeanderingProgrammer/render-markdown.nvim",
    },
    checker = { enabled = true },
  }

  local cmp = require "cmp"

  cmp.setup {
    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert {
      ["<c-b>"] = cmp.mapping.scroll_docs(-4),
      ["<c-f>"] = cmp.mapping.scroll_docs(4),
      ["<c-space>"] = cmp.mapping.complete(),
      ["<c-e>"] = cmp.mapping.abort(),
      ["<cr>"] = cmp.mapping.confirm { select = true },
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
    }, {
      { name = "buffer" },
    }),
  }

  require("mason").setup()

  require("mason-lspconfig").setup {
    ensure_installed = {
      "bashls",
      "css_variables",
      "cssls",
      "cssmodules_ls",
      "cucumber_language_server",
      "docker_compose_language_service",
      "dockerls",
      "emmet_language_server",
      "eslint",
      "jsonls",
      "lua_ls",
      "marksman",
      "nginx_language_server",
      "tailwindcss",
      "ts_ls",
    },
    automatic_installation = true,
  }

  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  require("mason-lspconfig").setup_handlers {
    function(server_name)
      require("lspconfig")[server_name].setup {
        capabilities = capabilities,
      }
    end,
  }

  require("conform").setup {
    formatters_by_ft = {
      css = { "prettier" },
      html = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      json = { "prettier" },
      lua = { "stylua" },
      markdown = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      yaml = { "prettier" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  }

  require("nvim-tree").setup {
    view = {
      width = {
        min = 30,
      },
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
  }

  vim.keymap.set("n", "<c-n>", vim.cmd.NvimTreeFindFileToggle)
  vim.keymap.set("n", "<esc>", vim.cmd.nohl)
  vim.keymap.set("n", "<leader>D", require("telescope.builtin").lsp_type_definitions)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
  vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols)
  vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers)
  vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
  vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep)
  vim.keymap.set("n", "<leader>fm", require("conform").format)
  vim.keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
  vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols)
  vim.keymap.set("n", "<s-tab>", vim.cmd.bprev)
  vim.keymap.set("n", "<tab>", vim.cmd.bnext)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
  vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations)
  vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)
  vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references)
end
