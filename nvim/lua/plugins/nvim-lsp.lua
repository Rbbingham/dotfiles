return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Additional lua configuration, makes nvim stuff amazing!
			"folke/neodev.nvim",
		},
		config = function()
			local on_attach = function(_, bufnr)
				local nmap = function(keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end

					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end

				nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
				nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

				-- See `:help K` for why this keymap
				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
				nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

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

			-- document existing key chains
			require("which-key").register {
				["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
				["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
				["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
				["<leader>h"] = { name = "More git", _ = "which_key_ignore" },
				["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
				["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
				["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
			}

			require("mason").setup()
			require("mason-lspconfig").setup()

			local servers = {
				clangd = {
					cmd = {
						"clangd",
						"--all-scopes-completion",
						"--background-index",
						"--clang-tidy",
						"--query-driver=/usr/bin/g++",
					},
					filetypes = { "c", "cpp", "objc", "objcpp" },
				},

				cmake = {
					cmd = { "cmake-language-server" },
					filetypes = { "cmake" },
					init_options = {
						buildDirectory = "build",
					},
					single_file_support = true,
				},

				pyright = {
					cmd = { vim.fn.stdpath("data") .. "/mason/bin/pyright-langserver", "--stdio" },
					filetypes = { "python" },
					python = {
						disableLanguageServices = false,
						disableOrganizeImports = false,
						openFilesOnly = false,
						analysis = {
							autoImportCompletions = true,
							autoSearchPaths = true,
							diagnosticMode = "workspace",
							typeCheckingMode = "basic", -- off, basic, strict
							useLibraryCodeForTypes = true,
						}
					},
					single_file_support = true,
				},

				lua_ls = {
					Lua = {
						semantic = {
							enable = false,
						},
						hint = { enable = true },
						telemetry = { enable = false },
						maxPreload = 100000,
						preloadFileSize = 10000,
					},
				},

				texlab = {
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
					},
				},
			}

			-- Setup neovim lua configuration
			require("neodev").setup()

			-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			-- Ensure the servers above are installed
			local mason_lspconfig = require "mason-lspconfig"

			mason_lspconfig.setup {
				ensure_installed = vim.tbl_keys(servers),
			}

			mason_lspconfig.setup_handlers {
				function(server_name)
					require("lspconfig")[server_name].setup {
						capabilities = capabilities,
						on_attach = on_attach,
						settings = servers[server_name],
						filetypes = (servers[server_name] or {}).filetypes,
					}
				end,
			}
		end,
	}
}
