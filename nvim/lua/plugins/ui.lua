return {
	{
		-- TODO: optimize lualine
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				}
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 1 }, "searchcount" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = {
					function()
						return " " .. os.date("%R")
					end
				},
				lualine_z = {
					{ "location", padding = { left = 0, right = 1 } },
					{ "progress", seperator = " ", padding = { left = 1, right = 1 } },
				}
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {}
			},
			tabline = {
				lualine_a = { "buffers" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "tabs" }
			},
			winbar = {},
			inactive_winbar = {},
			extensions = { "nvim-tree" }
		}
	},

	{
		-- adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = function()
			return require("plugins.config.others").gitsigns
		end,
		config = function(_, opts)
			require("gitsigns").setup(opts)
		end,
	},

	{
		"kshenoy/vim-signature",
		event = "VeryLazy",
	},
}
