return {
	cmd = {
		"clangd",
		"--all-scopes-completion",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"-j=6"
	},
	single_file_support = true,
}
