  vim.api.nvim_create_autocmd("CursorHold", {
    group = vim.api.nvim_create_augroup("MyCursorHoldGroup", { clear = true }),
    pattern = "*",
    callback = function()
      vim.cmd("silent! mode")
    end
  })
