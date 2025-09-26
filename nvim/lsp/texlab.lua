return {
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
}
