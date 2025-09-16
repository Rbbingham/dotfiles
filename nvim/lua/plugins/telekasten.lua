return {
	"renerocksai/telekasten.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	ft = { "markdown" },
	cmd = { "Telekasten" },
	opts = function()
		return require("plugins.config.others").telekasten
	end,
	config = function(_, opts)
		require("telekasten").setup(opts)
	end,
}
