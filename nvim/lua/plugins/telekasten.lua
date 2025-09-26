return {
	"renerocksai/telekasten.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	ft = { "markdown" },
	cmd = { "Telekasten" },
	config = function()
		require("telekasten").setup({
			home = vim.fn.expand("~/Documents/Notes/"),
			dailies = vim.fn.expand("~/Documents/Notes/"),
			weeklies = vim.fn.expand("~/Documents/Notes/"),
			templates = vim.fn.expand("~/.config/nvim/templates/"),

			template_new_note = vim.fn.expand("~/.config/nvim/templates/notes/notes.md"),
			template_new_daily = vim.fn.expand("~/.config/nvim/templates/dailies/dailies.md"),
			template_new_weekly = vim.fn.expand("~/.config/nvim/templates/weeklies/weeklies.md"),
			new_note_filename = "uuid-title",
			uuid_type = "%Y-%m-%d",

			take_over_my_home = false,
			auto_set_filetype = false,
		})
	end,
}
