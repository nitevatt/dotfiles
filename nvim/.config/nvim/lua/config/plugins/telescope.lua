local M = {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.0",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-project.nvim" },
}

M.config = function()
  local telescope = require("telescope")
  local builtin = require("telescope.builtin")

  telescope.load_extension("project")

  vim.keymap.set("n", "<leader>fe", function() builtin.buffers { sort_lastused = true, sort_mru = true } end, {})
  vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
  vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
  vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})

  vim.keymap.set("n", "<leader>r", telescope.extensions.project.project, {})
end

return M
