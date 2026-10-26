return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = { style = "night" },
	config = function(_, opts)
		require("tokyonight").load(opts)
	end,
}
