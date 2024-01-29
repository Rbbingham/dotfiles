local cmp = require("cmp")
local luasnip = require("luasnip")

local kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "󰂡",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
}

local formatting_style = {
	format = function(entry, vim_item)
		vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)

		vim_item.menu = ({
			buffer = "[Buffer]",
			nvim_lsp = "[LSP]",
			luasnip = "[LuaSnip]",
			nvim_lua = "[Lua]",
			["vim_dadbod_completion"] = "[DB]",
			path = "[Path]",
			latex_symbols = "[LaTeX]",
		})[entry.source.name]

		vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
		return vim_item
	end,

	fields = { "kind", "abbr", "menu"},
}

local options = {
	cmp.setup({
		completion = {
			completeopt = "menu,menuone",
		},

		formatting = formatting_style,

  	window = {
			completion = {
				scrollbar = false,
				side_padding = 0,
				border = "single",
			},
			documentation = {
				border = "single",
			}
  	},

		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},

		mapping = cmp.mapping.preset.insert {
			["<C-j>"] = cmp.mapping.abort(),
			["<C-k>"] = cmp.mapping.abort(),
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-u>"] = cmp.mapping.scroll_docs(-4),
			["<C-d>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.close(),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			}),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_locally_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.locally_jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		},

		-- TODO: setup sources for specific buffers
		sources = {
			{ name = "nvim_lsp", priority = 1000 },
			{ name = "luasnip", priority = 750 },
			{ name = "buffer", priority = 500 },
			{ name = "path", priority = 250 },
		},
	}),

	cmp.setup.filetype({"sql", "mysql", "plsql"}, {
		sources = {
			{ name = "luasnip", priority = 1000 },
			{ name = "vim-dadbod-completion", priority = 750 },
		}
	})
}

return options
