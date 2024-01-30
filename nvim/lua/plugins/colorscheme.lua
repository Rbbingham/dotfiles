return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
				transparent_background = true,
				show_end_of_buffer = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = false,
						indentscope_color = "",
					},
					telekasten = true,
					lsp_trouble = true,
					which_key = true,
				}
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end
	}
}
