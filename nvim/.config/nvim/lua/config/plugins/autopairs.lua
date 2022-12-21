--[[
function(cmp)
  local ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

  if not ok then
    return
  end

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end
--]]

local M = { "windwp/nvim-autopairs" }

M.config = function()
  require("nvim-autopairs").setup()
end

return M
