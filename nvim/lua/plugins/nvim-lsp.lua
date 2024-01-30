return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = function()
			return require("plugins.config.mason")
		end,
		config = function(_, opts)
			require("mason").setup(opts)

			vim.api.nvim_create_user_command("MasonInstallAll", function()
				vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
			end, {})

			vim.g.mason_binaries_list = opts.ensure_installed
		end,
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "LspInfo", "LspInstall", "LspUninstall" },
		config = function()
			require("plugins.config.lspconfig")

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
				vim.lsp.handlers.hover, {
					-- Use a sharp border with `FloatBorder` highlights
					border = "single",
				}
			)

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
				vim.lsp.handlers.signature_help, {
					-- Use a sharp border with `FloatBorder` highlights
					border = "single"
				}
			)

			require("which-key").register {
				-- document existing key chains
				["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
				["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
				["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
				["<leader>h"] = { name = "More git", _ = "which_key_ignore" },
				["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
				["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
				["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
			}

			vim.api.nvim_set_hl(0, '@lsp.type.comment', {})
		end,
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Toggle trouble list" })
			vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end,
				{ desc = "Toggle workspace diagnostics" })
			vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,
				{ desc = "Toggle document diagnostics" })
			vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end,
				{ desc = "Toggle quickfix" })
			vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end,
				{ desc = "Toggle location list" })
			vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end,
				{ desc = "Toggle LSP references" })
		end
	}
}
