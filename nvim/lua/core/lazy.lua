local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local is_windows = vim.fn.has("win32") ~= 0
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH

if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	rocks = {
		enabled = false,
	},
	ui = {
		icons = {
			ft = "",
			lazy = "󰂠 ",
			loaded = "",
			not_loaded = "",
		},
	},
	performance = {
		rtp = {
			reset = true,
			disabled_plugins = {
				"netrwPlugin",
				"tutor",
			},
		},
		cache = {
			enabled = true,
		},
		reset_packpath = true,
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
})
