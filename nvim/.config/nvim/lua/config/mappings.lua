local toggle_theme = require("core.helpers").toggle_theme
local organize_imports = require("core.helpers").organize_imports

vim.keymap.set("n", "<c-n>", vim.cmd.NvimTreeFindFileToggle)
vim.keymap.set("n", "<esc>", vim.cmd.nohl)
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>e", vim.diagnostic.setloclist)
vim.keymap.set("n", "<leader>o", organize_imports)
vim.keymap.set("n", "<leader>qf", vim.cmd.Format)
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>th", toggle_theme)
vim.keymap.set("n", "<leader>x", vim.cmd.bdelete)
vim.keymap.set("n", "<s-tab>", vim.cmd.bprevious)
vim.keymap.set("n", "<tab>", vim.cmd.bnext)

vim.keymap.set("v", "<leader>d", "yPgv")
