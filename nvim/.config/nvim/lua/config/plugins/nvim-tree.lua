local M = {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
}

M.config = function()
  require("nvim-tree").setup({
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
  })

  vim.keymap.set("n", "<c-n>", "<cmd>NvimTreeToggle<cr>", {})
  vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeFindFile<cr>", {})
end

return M
