return {
	"ibhagwan/fzf-lua",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},
	opts = {
		winopts = {
			split = "belowright new",
			preview = {
				layout = "horizontal",
				horizontal = "right:50%",
			},
		},
	},
}
