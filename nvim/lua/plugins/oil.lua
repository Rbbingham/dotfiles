return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			keymaps = {
				["~"] = "<cmd>edit $HOME<CR>",
				["<leader>xx"] = {
					"actions.open_cmdline",
					opts = {
						shorten_path = true,
					},
					desc = "Open the command line with the current file as an argument",
				},
				["<leader>xX"] = {
					"actions.open_cmdline",
					opts = {
						shorten_path = true,
						modify = ":h",
					},
					desc = "Open the command line with the current directory as an argument",
				},
				["<leader>xb"] = {
					function()
						local oil = require("oil")
						local fs = require("oil.fs")
						local entry = oil.get_cursor_entry()
						if not entry then
							return
						end
						local path = vim.api.nvim_buf_get_name(0):gsub("^.*://", "")
						local fullpath = fs.posix_to_os_path(path) .. entry.name
						fullpath = fs.shorten_path(fullpath)

						--- @param opt vim.SystemCompleted
						local on_exit = vim.schedule_wrap(function(opt)
							local bufnr = vim.api.nvim_create_buf(false, true)
							vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, vim.split(opt.stdout .. opt.stderr, "\n"))
							vim.api.nvim_open_win(bufnr, true, { split = "below" })
						end)

						--- @param input string
						local on_confirm = function(input)
							if input == nil or input == "" then
								return
							end
							if vim.fn.executable(vim.split(input, " ")[1]) == 0 then
								print("Input is not an executable")
								return
							end
							local command = vim.list_extend(vim.split(input, " "), { fullpath })
							vim.system(command, { text = true }, on_exit)
						end

						vim.ui.input({ prompt = fullpath .. " > " }, on_confirm)
					end
				},
				desc = "Execute command on current file and open output in split buffer",
			},
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, _)
					return name == ".." or name == ".git"
				end,
			},
			win_options = {
				wrap = true,
			},
		})
	end,
}
