return {
	-- adds git related signs to the gutter, as well as utilities for managing changes
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				vim.keymap.set({ "n", "v" }, "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { buffer = bufnr, desc = "Jump to next hunk" })

				vim.keymap.set({ "n", "v" }, "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { buffer = bufnr, desc = "Jump to previous hunk" })
			end,
		})
	end,
}
