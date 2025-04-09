return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({ async = true })
			end,
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
		},
		format_on_save = {
			timeout_ms = 500,
		},
	},
}
