local opts = {
	default_file_explorer = true,
	delete_to_trash = true,
	columns = {
		"icon",
		"permissions",
	},
	skip_confirm_for_simple_edits = true,
	view_options = {
		show_hidden = true,
		natural_order = true,
		is_always_hidden = function(name, _)
			return name == ".." or name == ".git"
		end,
	},
	win_options = {
		wrap = true,
	},
}

return opts
