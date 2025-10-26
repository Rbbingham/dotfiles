vim.lsp.config("texlab", {
	settings = {
		auxDirectory = "build",
		build = {
			args = { "-pdf", "-output-directory=build", "-interaction=nonstopmode", "-synctex=1", "%f" },
			forwardSearchAfter = true,
			onSave = false,
		},
		forwardSearch = {
			args = { "--synctex-forward", "%l:1:%f", "%p" },
			executable = "zathura",
		},
	},
})
