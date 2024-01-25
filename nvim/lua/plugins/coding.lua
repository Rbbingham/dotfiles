return {
	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
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
					local cmp_autopairs = require "nvim-autopairs.completion.cmp"
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},

			-- cmp sources plugins
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
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
    event = "VeryLazy",
		config = function ()
			require("telekasten").setup({
				home = vim.fn.expand("~/Documents/Notes/"),
				dailies = vim.fn.expand("~/Documents/Notes/"),
				weeklies = vim.fn.expand("~/Documents/Notes/"),
				templates = vim.fn.expand("~/.config/nvim/templates/"),

				template_new_note = vim.fn.expand("~/.config/nvim/templates/notes/notes.md"),
				template_new_daily = vim.fn.expand("~/.config/nvim/templates/dailies/dailies.md"),
				template_new_weekly = vim.fn.expand("~/.config/nvim/templates/weeklies/weeklies.md"),

				new_note_filename = "uuid-title",
				uuid_type = "%Y-%m-%d",
			})

			-- Launch panel if nothing is typed after <leader>z
			vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>")

			-- Most used functions
			vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
			vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
			vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
			vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
			vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
			vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
			vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")

			-- Call insert link automatically when we start typing a link
			vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")

		end
	},

	{
		"renerocksai/calendar-vim",
		event = "VeryLazy"
	},

	{
		"mzlogin/vim-markdown-toc",
		ft = { "markdown" }
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},

	-- SQL
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },

			{
				"kristijanhusak/vim-dadbod-completion",
				ft = { "sql", "mysql", "plsql" },
				lazy = true
			},
		},
		cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
		end
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
			vim.g.vimtex_log_ignore = ({
  			"Underfull",
  			"Overfull",
  			"specifier changed to",
  			"Token not allowed in a PDF string",
			})
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
		end
	},
}
