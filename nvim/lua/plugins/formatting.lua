return {
	{
		"godlygeek/tabular",
		event = "VeryLazy",
	},

	{
		"stevearc/conform.nvim",
		lazy = true,
		cmd = { "ConformInfo" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					c = { "clang_format" },
					cpp = { "clang_format" },
					javascript = { "prettier" },
					lua = { "stylua" },
					python = { "black" },
					rust = { "rustfmt" },
				},
				format_on_save = {
					timeout = 500,
					lsp_fallback = true,
				},
				formatters = {
					clang_format = {
						command = "clang-format",
						args = { "--style=Google", "$FILENAME" },
					},
				},
			})
		end,
	},
}
