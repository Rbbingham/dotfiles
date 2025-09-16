return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		spec = {
			{ "<leader>d", name = "[D]ocument" },
			{ "<leader>g", name = "[G]it" },
			{ "<leader>s", name = "[S]earch" },
			{ "<leader>t", name = "[T]rouble" },
			{ "<leader>w", name = "[W]orkspace" },
		},
	},
}
