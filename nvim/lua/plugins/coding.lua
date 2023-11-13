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

	{
		"jakewvincent/mkdnflow.nvim",
		ft = { "markdown" },
		config = function()
			require("mkdnflow").setup({
				perspective = {
					priority = "root",
					root_tell = "index.md",
				},
				new_file_template = {
					use_template = true,
					template = [[
# {{ title }}
Date: {{ date }}
]],
					placeholders = {
						before = {
							date = function()
								return os.date("%A, %B %d, %Y") -- Wednesday, March 1, 2023
							end
						},
					}
				},
			})
		end
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},

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
