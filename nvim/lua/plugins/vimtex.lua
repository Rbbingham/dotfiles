return {
	{
		"lervag/vimtex",
		ft = { "tex", "plain", "bib" },
		dependencies = {
			{
				"jbyuki/nabla.nvim",
				config = function()
					vim.keymap.set("n", "<Leader>p", ":lua require('nabla').popup()<CR>", { desc = "View math expression" })
				end,
			},
		},
		config = function()
			vim.g.tex_flavor = "latex"
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_quickfix_mode = 0
			vim.g.tex_conceal = "abdgm"
			vim.g.vimtex_compiler_method = "latexmk"
			vim.g.vimtex_view_forward_search_on_start = 1
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
			vim.g.vimtex_toc_config_matchers = {
				beamer_frame = { disable = 1 },
			}
		end
	}
}
