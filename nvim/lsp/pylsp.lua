vim.lsp.config("pylsp", {
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
