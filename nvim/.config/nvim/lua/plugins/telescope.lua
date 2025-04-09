return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>f", builtin.find_files)
    vim.keymap.set("n", "<leader>W", builtin.live_grep)
    vim.keymap.set("n", "<leader>b", builtin.buffers)

    vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols)
    vim.keymap.set("n", "<leader>S", builtin.lsp_workspace_symbols)
    vim.keymap.set("n", "gr", builtin.lsp_references)
    vim.keymap.set("n", "gd", builtin.lsp_definitions)
  end,
}
