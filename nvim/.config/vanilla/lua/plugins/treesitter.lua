return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPre",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = { "lua", "css" },
		highlight = {
			enable = true,
		},
	},
}
