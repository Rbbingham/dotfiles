return {
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},

	{
		"nvim-lua/plenary.nvim",
		event = "VeryLazy",
	},

	{
		"stevearc/oil.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = function()
			return require("plugins.config.oilnvim")
		end,
		config = function(_)
			require("oil").setup()
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		branch = "0.1.x",
		dependencies = {
			{
				"nvim-lua/plenary.nvim", lazy = true
			},
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				lazy = true,
				build = "make",
				cond = function()
					return vim.fn.executable "make" == 1
				end,
			},
		},
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = false,
						},
					},
				},
			})
			pcall(require("telescope").load_extension("fzf"))
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
			spec = {
				{ "<leader>b", name = "[B]uffers" },
				{ "<leader>c", name = "[C]ode" },
				{ "<leader>d", name = "[D]ocument" },
				{ "<leader>g", name = "[G]it" },
				{ "<leader>r", name = "[R]ename" },
				{ "<leader>s", name = "[S]earch" },
				{ "<leader>t", name = "[T]rouble" },
				{ "<leader>w", name = "[w]orkspace" },
			}
		},
	},
}
