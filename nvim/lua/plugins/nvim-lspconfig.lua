return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local on_attach = function(bufnr)
			local function opts(desc)
				return { buffer = bufnr, desc = "LSP " .. desc }
			end

			local map = vim.keymap.set
			map("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts("[G]oto [D]efinition"))
			map("n", "gI", "<cmd>FzfLua lsp_implementations<CR>", opts("[G]oto [I]mplementation"))
			map("n", "<leader>D", "<cmd>FzfLua lsp_typedefs<CR>", opts("Type [D]efinition"))
			map("n", "<leader>ds", "<cmd>FzfLua lsp_document_symbols<CR>", opts("[D]ocument [S]ymbols"))
			map("n", "<leader>ws", "<cmd>FzfLua lsp_live_workspace_symbols<CR>", opts("[W]orkspace [S]ymbols"))

			-- see `:help K` for why this keymap
			map("n", "K", vim.lsp.buf.hover, opts("Hover Documentation"))
			map("n", "<leader>k", vim.lsp.buf.signature_help, opts("Signature Documentation"))

			-- lesser used LSP functionality
			map("n", "gD", vim.lsp.buf.declaration, opts("[G]oto [D]eclaration"))
			map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("[W]orkspace [A]dd Folder"))
			map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("[W]orkspace [R]emove Folder"))
			map("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts("[W]orkspace [L]ist Folders"))

			require("which-key")
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()

		capabilities = {
			textDocument = {
				completion = {
					completionItem = {
						documentationFormat = { "markdown", "plaintext" },
						snippetSupport = true,
						preselectSupport = true,
						insertReplaceSupport = true,
						labelDetailsSupport = true,
						deprecatedSupport = true,
						commitCharactersSupport = true,
						tagSupport = { valueSet = { 1 } },
						resolveSupport = {
							properties = {
								"documentation",
								"detail",
								"additionalTextEdits",
							},
						},
					},
				},
			},
			workspace = {
				fileOperations = {
					didRename = true,
					willRename = true,
				},
			},
		}

		local severity = vim.diagnostic.severity
		vim.diagnostic.config({
			severity_sort = true,
			signs = {
				text = {
					[severity.ERROR] = "󰅙",
					[severity.WARN] = "",
					[severity.INFO] = "󰋼",
					[severity.HINT] = "󰌵",
				},
			},
			update_in_insert = false,
			underline = true,
			virtual_text = { prefix = "" },
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				on_attach(args.buf)
			end,
		})

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		vim.lsp.enable({
			"clangd",
			"lua_ls",
			"marksman",
			"pylsp",
			"rust_analyzer",
			"tinymist",
		})
	end,
}
