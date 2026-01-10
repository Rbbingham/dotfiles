return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			keymaps = {
				["~"] = "<cmd>edit $HOME<CR>",
				["<leader>x"] = {
					"actions.open_cmdline",
					opts = {
						shorten_path = true,
					},
					desc = "Open the command line with the current file as an argument",
				},
				["<leader>X"] = {
					"actions.open_cmdline",
					opts = {
						shorten_path = true,
						modify = ":h",
					},
					desc = "Open the command line with the current directory as an argument",
				},
			},
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, _)
					return name == ".." or name == ".git"
				end,
			},
			win_options = {
				wrap = true,
			},
		})
	end,
}
