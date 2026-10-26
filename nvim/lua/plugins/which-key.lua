return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		spec = {
			{ "gO", name = "Outline" },
			{ "gr", group = "LSP" },
			{ "gra", name = "LSP Code [A]ctions" },
			{ "gri", name = "LSP [I]mplementation" },
			{ "grn", name = "LSP Re[N]ame" },
			{ "grr", name = "LSP [R]eferences" },
			{ "grt", name = "LSP [T]ype Definitions" },
			{ "grx", name = "LSP Codelens" },
			{ "<leader>d", group = "[D]ocument" },
			{ "<leader>g", group = "[G]it" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>w", group = "[W]orkspace" },
		},
	},
}
