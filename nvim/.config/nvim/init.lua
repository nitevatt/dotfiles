vim.api.nvim_create_autocmd("CursorHold", {
	group = vim.api.nvim_create_augroup("MyCursorHoldGroup", { clear = true }),
	pattern = "*",
	callback = function()
		vim.cmd("mode")
	end,
})

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.updatetime = 300

vim.keymap.set("n", "<esc>", vim.cmd.noh)

vim.keymap.set("n", "<tab>", function()
	require("vscode").call("workbench.action.nextEditor")
end)

vim.keymap.set("n", "<s-tab>", function()
	require("vscode").call("workbench.action.previousEditor")
end)

vim.keymap.set("n", "<leader>fm", function()
	require("vscode").call("editor.action.formatDocument")
end)

vim.keymap.set("n", "<leader>rn", function()
	require("vscode").call("editor.action.rename")
end)
