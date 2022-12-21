local M = {
  -- "arcticicestudio/nord-vim",
  "navarasu/onedark.nvim",

}

M.config = function()
  require("onedark").load()
end

return M
