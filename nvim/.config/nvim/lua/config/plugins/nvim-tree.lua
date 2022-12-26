local M = {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
}

M.config = function()
  require("nvim-tree").setup({
    hijack_unnamed_buffer_when_opening = true,
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

  vim.keymap.set("n", "<c-n>", vim.cmd.NvimTreeToggle, {})
  vim.keymap.set("n", "<leader>n", vim.cmd.NvimTreeFindFile, {})
end

return M
