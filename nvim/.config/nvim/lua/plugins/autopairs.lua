local M = {}

M.setup = function(use)
  use "windwp/nvim-autopairs"
end

M.config = function()
  local ok, autopairs = pcall(require, "nvim-autopairs")

  if not ok then
    return
  end

  autopairs.setup()
end

M.on_confirm_done = function(cmp)
  local ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

  if not ok then
    return
  end

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return M
