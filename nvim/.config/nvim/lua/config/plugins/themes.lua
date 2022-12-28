local M = {
  -- "arcticicestudio/nord-vim",
  -- "navarasu/onedark.nvim",
  -- "rose-pine/neovim", name = "rose-pine",
  "catppuccin/nvim", as = "catppuccin"
}

M.config = function()
  -- vim.cmd.colorscheme("nord")
  -- require("onedark").load()
  -- vim.cmd.colorscheme("rose-pine")
  vim.cmd.colorscheme("catppuccin")
end

return M
