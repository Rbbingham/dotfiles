return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				vim.keymap.set({ "n", "v" }, "]g", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]g", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { buffer = bufnr, desc = "Jump to next hunk" })

				vim.keymap.set({ "n", "v" }, "[g", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[g", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { buffer = bufnr, desc = "Jump to previous hunk" })
			end,
		})
	end,
}
