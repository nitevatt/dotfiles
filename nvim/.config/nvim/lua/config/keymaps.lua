vim.keymap.set("n", "<esc>", vim.cmd.nohl, {})
vim.keymap.set("n", "<leader>uu", function() vim.cmd.Lazy("check") end, {})
vim.keymap.set("n", "<leader>x", vim.cmd.bd, {})
vim.keymap.set("n", "<leader>X", function() vim.cmd.bufdo("bd") end, {})

vim.keymap.set("n", "<c-h>", "<c-w>h", {})
vim.keymap.set("n", "<c-j>", "<c-w>j", {})
vim.keymap.set("n", "<c-k>", "<c-w>k", {})
vim.keymap.set("n", "<c-l>", "<c-w>l", {})

vim.keymap.set("v", "<leader>d", "y'>p", {})
vim.keymap.set("v", "<leader>p", '"_dp', {})
vim.keymap.set("v", "<", "<gv", {})
vim.keymap.set("v", ">", ">gv", {})
