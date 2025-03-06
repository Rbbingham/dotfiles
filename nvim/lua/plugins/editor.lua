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
		config = function(_, opts)
			require("oil").setup(opts)
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		dependencies = {
			{
				"nvim-lua/plenary.nvim",
			},
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
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

			require("telescope").load_extension("fzf")
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
				{ "<leader>w", name = "[W]orkspace" },
			},
		},
	},
}
