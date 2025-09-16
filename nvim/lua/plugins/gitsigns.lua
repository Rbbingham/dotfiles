return {
	-- adds git related signs to the gutter, as well as utilities for managing changes
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	opts = function()
		return require("plugins.config.others").gitsigns
	end,
	config = function(_, opts)
		require("gitsigns").setup(opts)
	end,
}
