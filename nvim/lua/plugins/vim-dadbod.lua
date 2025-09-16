return {
	"tpope/vim-dadbod",
	dependencies = {
		{ "kristijanhusak/vim-dadbod-ui" },
	},
	cmd = { "DB", "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
	ft = { "sql", "mysql", "plsql" },
	init = function()
		vim.g.db_ui_use_nerd_fonts = 1
	end,
}
