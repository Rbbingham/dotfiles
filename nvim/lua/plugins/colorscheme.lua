return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				show_end_of_buffer = true,
				integrations = {
					alpha = false,
					barbecue = {
						dim_dirname = false,
						bold_basename = false,
						dim_context = false,
						alt_background = false,
					},
					cmp = true,
					dashboard = false,
					flash = false,
					gitsigns = true,
					indent_blankline = {
						enabled = false,
					},
					mini = {
						enabled = false,
						indentscope_color = "",
					},
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
							ok = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
							ok = { "underline" },
						},
						inlay_hints = {
							background = true,
						},
					},
					neogit = false,
					notify = false,
					nvimtree = false,
					telekasten = true,
					telescope = {
						enabled = true,
					},
					treesitter = true,
					lsp_trouble = true,
					ufo = false,
					which_key = true,
				},
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
