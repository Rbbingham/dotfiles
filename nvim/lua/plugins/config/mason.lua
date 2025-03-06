local M = {
	ensure_installed = {
		"lua-language-server",
		"clangd",
		"cmake-language-server",
		"python-lsp-server",
		"marksman",
		"texlab",
	},

	PATH = "prepend",

	ui = {
		icons = {
			package_pending = " ",
			package_installed = "󰄳 ",
			package_uninstalled = " 󰚌",
		},
	},

	max_concurrent_installers = 10,
}

return M
