vim.api.nvim_create_autocmd("CursorHold", {
	group = vim.api.nvim_create_augroup("MyCursorHoldGroup", { clear = true }),
	pattern = "*",
	callback = function()
		vim.cmd("mode")
	end,
})

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<tab>", function()
	require("vscode").call("workbench.action.nextEditor")
end)

vim.keymap.set("n", "<s-tab>", function()
	require("vscode").call("workbench.action.previousEditor")
end)
