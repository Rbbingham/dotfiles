local M = {}

M.on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>cq", vim.lsp.buf.code_action, "[C]ode [Q]uixfix")

	nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
	nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<leader>k", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(M.capabilities)

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

local lsp = require("lspconfig")

lsp.lua_ls.setup {
	on_attach = M.on_attach,
	capabilities = M.capabilities,

	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			runtime = {
				version = 'LuaJIT'
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME
				}
			},
			hint = { enable = true },
			maxPreload = 100000,
			preloadFileSize = 10000,
		}
	}
}

lsp.clangd.setup {
	on_attach = M.on_attach,
	capabilities = M.capabilities,

	cmd = {
		"clangd",
		"--all-scopes-completion",
		"--background-index",
		"--clang-tidy",
		"--query-driver=/usr/bin/g++",
	},
	single_file_support = true,
	filetypes = { "c", "cc", "cpp", "h", "objc", "objcpp" },
}


lsp.cmake.setup {
	on_attach = M.on_attach,
	capabilities = M.capabilities,

	cmd = { "cmake-language-server" },
	filetypes = { "cmake" },
	init_options = {
		buildDirectory = "build",
	},
	single_file_support = true,
}

lsp.pylsp.setup {
	on_attach = M.on_attach,
	capabilities = M.capabilities,

	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { 'W391' },
					maxLineLength = 100
				}
			}
		}
	}
}

lsp.marksman.setup {
	on_attach = M.on_attach,
	capabilities = M.capabilities,

	cmd = { "marksman", "server" },
	filetypes = { "markdown", "markdown.mdx" }
}

lsp.texlab.setup {
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
			onSave = false
		},
		auxDirectory = "build",
		forwardSearch = {
			args = { "--synctex-forward", "%l:1:%f", "%p" },
			executable = "zathura",
		},
	}
}

return M
