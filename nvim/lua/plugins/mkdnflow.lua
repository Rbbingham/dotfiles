return {
	{
		"jakewvincent/mkdnflow.nvim",
		rocks = "luautf8",
		event = "VeryLazy",
		config = function()
			require("mkdnflow").setup({
				perspective = {
					priority = "root",
					root_tell = "index.md",
				}
			})
		end
	}
}
