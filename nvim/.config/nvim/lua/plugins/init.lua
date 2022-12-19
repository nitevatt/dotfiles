local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd [[packadd packer.nvim]]
end

local ok, packer = pcall(require, "packer")

if not ok then
  return
end

local autopairs = require("plugins.autopairs")
local cmp = require("plugins.cmp")
local gitsigns = require("plugins.gitsigns")
local lsp = require("plugins.lsp")
local lualine = require("plugins.lualine")
local null_ls = require("plugins.null-ls")
local nvimtree = require("plugins.nvim-tree")
local telescope = require("plugins.telescope")
local themes = require("plugins.themes")
local treesitter = require("plugins.treesitter")
local vimwiki = require("plugins.vimwiki")

packer.startup(function(use)
  use "wbthomason/packer.nvim"

  themes.setup(use)
  telescope.setup(use)
  nvimtree.setup(use)
  lualine.setup(use)
  treesitter.setup(use)
  gitsigns.setup(use)
  autopairs.setup(use)
  vimwiki.setup(use)
  cmp.setup(use)
  lsp.setup(use)
  null_ls.setup(use)
end)

themes.config()
telescope.config()
nvimtree.config()
lualine.config()
treesitter.config()
gitsigns.config()
autopairs.config()
cmp.config()
lsp.config()
null_ls.config()
