return {
	-- autocompletion
	"saghen/blink.cmp",
	version = "1.*",
	event = { "InsertEnter", "CmdLineEnter" },
	dependencies = {
		{
			-- snippet plugin
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
			opts = {
				update_events = "TextChanged,TextChangedI",
			},
			config = function(_, opts)
				require("luasnip").config.set_config(opts)
				require("luasnip.loaders.from_vscode").lazy_load()
				require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/snippets/" })
			end,
		},

		-- autopairing of (){}[] etc
		{
			"windwp/nvim-autopairs",
			opts = {
				fast_wrap = {},
			},
		},
	},

	opts = {
		snippets = { preset = "luasnip" },
		cmdline = { enabled = true },
		appearance = { nerd_font_variant = "normal" },
		fuzzy = { implementation = "prefer_rust" },
		sources = { default = { "lsp", "snippets", "buffer", "path" } },

		keymap = {
			preset = "default",
			["<CR>"] = { "accept", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
		},

		completion = {
			menu = {
				scrollbar = false,
				draw = {
					columns = { { "kind_icon" }, { "label" }, { "kind" } },
				},
			},
			documentation = {
				auto_show = true,
			},
		},
	},
}
