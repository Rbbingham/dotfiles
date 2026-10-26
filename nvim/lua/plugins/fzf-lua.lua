return {
	"ibhagwan/fzf-lua",
	lazy = true,
	cmd = "FzfLua",
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
