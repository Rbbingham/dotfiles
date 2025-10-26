return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall" },
	config = function()
		local on_attach = function(_, bufnr)
			local function opts(desc)
				return { buffer = bufnr, desc = "LSP " .. desc }
			end

			local map = vim.keymap.set
			map("n", "gd", require("telescope.builtin").lsp_definitions, opts("[G]oto [D]efinition"))
			map("n", "gI", require("telescope.builtin").lsp_implementations, opts("[G]oto [I]mplementation"))
			map("n", "<leader>D", require("telescope.builtin").lsp_type_definitions, opts("Type [D]efinition"))
			map("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, opts("[D]ocument [S]ymbols"))
			map(
				"n",
				"<leader>ws",
				require("telescope.builtin").lsp_dynamic_workspace_symbols,
				opts("[W]orkspace [S]ymbols")
			)

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

			-- create a command `:Format` local to the LSP buffer
			vim.api.nvim_buf_create_user_command(bufnr, "Format", function(options, _)
				if options.count == -1 then
					vim.lsp.buf.format({
						async = true,
					})
				else
					vim.lsp.buf.format({
						async = true,
						range = {
							["start"] = vim.api.nvim_buf_get_mark(0, "<"),
							["end"] = vim.api.nvim_buf_get_mark(0, ">"),
						},
					})
				end
			end, { desc = "Format current buffer with LSP", range = true })
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()

		capabilities.textDocument.completion.completionItem = {
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
		}

		local severity = vim.diagnostic.severity
		vim.diagnostic.config({
			float = {
				border = "single",
				scrollbar = true,
			},
			severity_sort = true,
			signs = {
				text = {
					[severity.ERROR] = "󰅙",
					[severity.WARN] = "",
					[severity.INFO] = "󰋼",
					[severity.HINT] = "󰌵",
				},
			},
			underline = true,
			virtual_text = { prefix = "" },
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				on_attach(_, args.buf)
			end,
		})

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		vim.lsp.enable({
			"clangd",
			"cmake",
			"lua_ls",
			"marksman",
			"pylsp",
			"rust-analyzer",
			"texlab",
		})
	end,
}
