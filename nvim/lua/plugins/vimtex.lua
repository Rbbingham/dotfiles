return {
	{
		"lervag/vimtex",
		ft = { "tex", "plain", "bib" },
		config = function()
			vim.g.tex_flavor = "latex"
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_quickfix_mode = 0
			vim.g.tex_conceal = "abdgms"
			vim.g.vimtex_syntax_enabled = 1
			vim.g.vimtex_compiler_method = "latexmk"
			vim.g.vimtex_log_ignore = ({
  			"Underfull",
  			"Overfull",
  			"specifier changed to",
  			"Token not allowed in a PDF string",
			})
			vim.g.vimtex_compiler_latexmk = {
				aux_dir = "./build",
				out_dir = ".",
				continuous = 1,
				executable = "latexmk",
				options = {
					"-pdf",
					"-synctex=4",
					"-interaction=nonstopmode",
				},
			}
		end
	}
}
