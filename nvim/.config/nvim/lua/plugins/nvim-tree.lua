local M = {}

M.setup = function(use)
  use { "nvim-tree/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons" }
end

M.config = function()
  local ok, nvimtree = pcall(require, "nvim-tree")

  if not ok then
    return
  end

  nvimtree.setup {
    actions = {
      open_file = {
        quit_on_open = true
      }
    },
    update_focused_file = {
      update_root = true
    },
    view = {
      adaptive_size = true
    }
  }

  vim.keymap.set("n", "<c-n>", "<cmd>NvimTreeToggle<cr>", {})
  vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeFindFile<cr>", {})
end

return M
