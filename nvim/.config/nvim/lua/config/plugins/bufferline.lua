local M = {
  "akinsho/bufferline.nvim",
  require = "nvim-tree/nvim-web-devicons",
  version = "v3.*"
}

M.config = function()
  require("bufferline").setup()
end

return M
