local M = {}

M.setup = function(use)
  use { "nvim-telescope/telescope.nvim", tag = "0.1.0", requires = "nvim-lua/plenary.nvim" }
  use "nvim-telescope/telescope-project.nvim"
end

local function load_extension(name)
  local ok, telescope = pcall(require, "telescope")

  if not ok then
    return
  end

  pcall(telescope.load_extension, name)

  if telescope.extensions.project then
    vim.keymap.set("n", "<leader>r", telescope.extensions.project.project, {})
  end
end

M.config = function()
  local ok, builtin = pcall(require, "telescope.builtin")

  if not ok then
    return
  end

  load_extension('project')

  vim.keymap.set("n", "<leader>fe", function() builtin.buffers { sort_lastused = true, sort_mru = true } end, {})
  vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
  vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
  vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
end

return M
