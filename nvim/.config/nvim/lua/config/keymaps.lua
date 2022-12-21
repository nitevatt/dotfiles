vim.keymap.set("n", "<esc>", vim.cmd.nohl, {})
vim.keymap.set("n", "<leader>uu", vim.cmd.PackerSync, {})
vim.keymap.set("n", "<leader>x", vim.cmd.bd, {})
vim.keymap.set("n", "<leader>X", function() vim.cmd.bufdo("bd") end, {})
vim.keymap.set("v", "<leader>d", "y'>p", {})
vim.keymap.set("v", "<", "<gv", {})
vim.keymap.set("v", ">", ">gv", {})