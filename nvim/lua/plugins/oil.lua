return {
	"stevearc/oil.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = function()
		return require("plugins.config.oilnvim")
	end,
	config = function(_, opts)
		require("oil").setup(opts)
	end,
}
