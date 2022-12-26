local M = {
  -- "arcticicestudio/nord-vim",
  -- "navarasu/onedark.nvim",
  "rose-pine/neovim",
  name = "rose-pine"

}

M.config = function()
  -- require("onedark").load()
  vim.cmd.colorscheme("rose-pine")
end

return M
