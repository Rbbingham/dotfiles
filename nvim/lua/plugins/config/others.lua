local M = {}

M.gitsigns = {
	signs = {
		add = { text = "" },
		change = { text = "" },
		delete = { text = "" },
		topdelete = { text = "▔" },
		changedelete = { text = "»" },
		untracked = { text = "┆" },
	},
	on_attach = function(bufnr)
		-- don't override the built-in and fugitive keymaps
		local gs = package.loaded.gitsigns
		vim.keymap.set({ "n", "v" }, "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
		vim.keymap.set({ "n", "v" }, "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })
	end,
}

M.luasnip = function(opts)
	require("luasnip").config.set_config(opts)

	require("luasnip.loaders.from_vscode").lazy_load()

	require("luasnip").filetype_extend("mysql", { "sql" })
	require("luasnip").filetype_extend("plsql", { "sql" })

	require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/snippets/" })

	vim.api.nvim_create_autocmd("InsertLeave", {
		callback = function()
			if
				require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
				and not require("luasnip").session.jump_active
			then
				require("luasnip").unlink_current()
			end
		end,
	})
end

M.telekasten = {
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
}

return M
