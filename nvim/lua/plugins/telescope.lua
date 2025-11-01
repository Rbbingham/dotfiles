return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				border = true,
				borderchars = {
					preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
					results = { " " },
				},
				entry_prefix = " ",
				layout_config = {
					height = 25,
				},
				layout_strategy = "bottom_pane",
				mappings = {
					n = { ["q"] = require("telescope.actions").close },
				},
				selection_caret = " ",
				sorting_strategy = "ascending",
			},
		})
	end,
}
