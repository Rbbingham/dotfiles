local M = {}
local map = vim.keymap.set
local lsp = require("lspconfig")

M.on_attach = function(_, bufnr)
	local function opts(desc)
		return { buffer = bufnr, desc = "LSP " .. desc }
	end

	map("n", "<leader>rn", vim.lsp.buf.rename, opts("[R]e[n]ame"))
	map("n", "<leader>cq", vim.lsp.buf.code_action, opts("[C]ode [Q]uixfix"))

	map("n", "gd", require("telescope.builtin").lsp_definitions, opts("[G]oto [D]efinition"))
	map("n", "gr", require("telescope.builtin").lsp_references, opts("[G]oto [R]eferences"))
	map("n", "gI", require("telescope.builtin").lsp_implementations, opts("[G]oto [I]mplementation"))
	map("n", "<leader>D", require("telescope.builtin").lsp_type_definitions, opts("Type [D]efinition"))
	map("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, opts("[D]ocument [S]ymbols"))
	map("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, opts("[W]orkspace [S]ymbols"))

	-- See `:help K` for why this keymap
	map("n", "K", vim.lsp.buf.hover, opts("Hover Documentation"))
	map("n", "<leader>k", vim.lsp.buf.signature_help, opts("Signature Documentation"))

	-- Lesser used LSP functionality
	map("n", "gD", vim.lsp.buf.declaration, opts("[G]oto [D]eclaration"))
	map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("[W]orkspace [A]dd Folder"))
	map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("[W]orkspace [R]emove Folder"))
	map("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts("[W]orkspace [L]ist Folders"))

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
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

M.defaults = function()
	lsp.lua_ls.setup({
		on_attach = M.on_attach,
		capabilities = M.capabilities,

		on_init = function(client)
			if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
					return
				end
			end

			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				runtime = {
					-- Tell the language server which version of Lua you're using
					-- (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				-- Make the server aware of Neovim runtime files
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
					},
				},
			})
		end,

		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				runtime = {
					version = "LuaJIT",
				},
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
					},
				},
				hint = { enable = true },
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	})

	lsp.clangd.setup({
		on_attach = M.on_attach,
		capabilities = M.capabilities,

		cmd = {
			"clangd",
			"--all-scopes-completion",
			"--background-index",
			"--clang-tidy",
		},
		filetypes = { "c", "cc", "cxx", "cpp", "h", "objc", "objcpp" },
		single_file_support = true,
	})

	lsp.cmake.setup({
		on_attach = M.on_attach,
		capabilities = M.capabilities,

		cmd = { "cmake-language-server" },
		filetypes = { "cmake" },
		init_options = {
			buildDirectory = "build",
		},
		single_file_support = true,
	})

	lsp.pylsp.setup({
		on_attach = M.on_attach,
		capabilities = M.capabilities,

		settings = {
			pylsp = {
				plugins = {
					pylint = {
						enabled = true,
					},
					mypy = {
						enabled = true,
					},
					pycodestyle = {
						enabled = false,
					},
					isort = {
						enabled = true,
					},
				},
			},
		},
	})

	lsp.marksman.setup({
		on_attach = M.on_attach,
		capabilities = M.capabilities,
	})

	lsp.texlab.setup({
		on_attach = M.on_attach,
		capabilities = M.capabilities,

		cmd = { "texlab" },
		filetypes = { "tex", "plaintex", "bib" },
		single_file_support = true,
		settings = {
			build = {
				args = { "-pdf", "-output-directory=build", "-interaction=nonstopmode", "-synctex=1", "%f" },
				executable = "latexmk",
				forwardSearchAfter = true,
				onSave = false,
			},
			auxDirectory = "build",
			forwardSearch = {
				args = { "--synctex-forward", "%l:1:%f", "%p" },
				executable = "zathura",
			},
		},
	})
end

return M
