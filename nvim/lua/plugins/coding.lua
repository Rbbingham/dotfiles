return {
	{
		-- autocompletion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets" },
				opts = {
					history = true,
					updateevents = "TextChanged,TextChangedI",
				},
				config = function(_, opts)
					require("plugins.config.others").luasnip(opts)
				end,
			},

			-- autopairing of (){}[] etc
			{
				"windwp/nvim-autopairs",
				opts = {
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
				config = function(_, opts)
					require("nvim-autopairs").setup(opts)

					-- setup cmp for autopairs
					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},

			-- cmp sources plugins
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		opts = function()
			return require("plugins.config.cmp")
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},

	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("Comment").setup()
		end,
	},

	-- Markdown
	{
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
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- SQL
	{
		"tpope/vim-dadbod",
		dependencies = {
			{ "kristijanhusak/vim-dadbod-ui" },
		},
		cmd = { "DB", "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
		ft = { "sql", "mysql", "plsql" },
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},

	{
		"kristijanhusak/vim-dadbod-completion",
		event = "InsertEnter *.sql",
	},

	-- Latex
	{
		"lervag/vimtex",
		ft = { "tex", "plain", "bib" },
		config = function()
			vim.g.tex_flavor = "latex"
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_quickfix_mode = 0
			vim.g.tex_conceal = "abdgms"
			vim.g.vimtex_syntax_enabled = 1
			vim.g.vimtex_compiler_method = "latexmk"
			vim.g.vimtex_log_ignore = {
				"Underfull",
				"Overfull",
				"specifier changed to",
				"Token not allowed in a PDF string",
			}
			vim.g.vimtex_compiler_latexmk = {
				aux_dir = "./build",
				out_dir = ".",
				continuous = 1,
				executable = "latexmk",
				options = {
					"-pdf",
					"-synctex=4",
					"-interaction=nonstopmode",
				},
			}
		end,
	},
}
