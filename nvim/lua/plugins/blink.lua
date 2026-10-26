return {
	"saghen/blink.cmp",
	version = "1.*",
	event = { "InsertEnter", "CmdLineEnter" },
	dependencies = {
		"rafamadriz/friendly-snippets",
	},

	opts = {
		snippets = { preset = "default" },
		cmdline = { enabled = true },
		appearance = { nerd_font_variant = "normal" },
		fuzzy = { implementation = "prefer_rust" },
		sources = { default = { "lsp", "path", "snippets", "buffer" } },

		keymap = {
			preset = "default",
			["<CR>"] = { "accept", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
		},

		completion = {
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
			menu = {
				scrollbar = false,
				draw = {
					columns = { { "kind_icon" }, { "label" }, { "kind" } },
					treesitter = { "lsp" },
				},
			},
			documentation = {
				auto_show = true,
			},
		},
	},
}
