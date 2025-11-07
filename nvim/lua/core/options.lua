-- stylua: ignore start
local options = {
	------------------------------------------------------------------------
	--                         General settings                           --
	------------------------------------------------------------------------
	clipboard = "unnamedplus",              -- sync clipboard between OS and Neovim
	completeopt = "menuone,noselect,fuzzy", -- customize insert mode completion
	cursorline = true,                      -- highlight text line of cursor
	laststatus = 3,                         -- global statusline
	nrformats = "hex,bin,unsigned",         -- set inc/dec
	termguicolors = true,                   -- enable 24-bit RGB color in the TUI
	timeoutlen = 400,                       -- time delay on <Leader> key
	updatetime = 250,                       -- update time
	virtualedit = "block",                  -- allow cursor to go past end of line in visual block mode

	------------------------------------------------------------------------
	--                         Files and backup                           --
	------------------------------------------------------------------------
	fileencoding = "utf-8",                 -- encoding written to file
	fileformats = "unix",                   -- use Unix as the standard file type
	swapfile = false,                       -- disable swap files
	undofile = true,                        -- enable persistent undo
	writebackup = false,                    -- prevents automatic write backup

	------------------------------------------------------------------------
	--                         Buffers management                         --
	------------------------------------------------------------------------
	showtabline = 2,                        -- always show tab page
	switchbuf = "useopen,usetab,newtab",    -- set behavior when switching between buffers

	------------------------------------------------------------------------
	--                         Multiple windows                           --
	------------------------------------------------------------------------
	splitbelow = true,                      -- put split window below current one
	splitright = true,                      -- put split window to the right of current one
	winborder = "single",                   -- border around floating window

	------------------------------------------------------------------------
	--                         Indentation tabs                           --
	------------------------------------------------------------------------
	copyindent = true,                      -- copy the previous indentation on autoindenting
	list = true,                            -- don't show tabs
	listchars = "tab:┊ ,trail:¬",           -- set tab and end-of-line characters
	preserveindent = true,                  -- preserve indent as much as possible
	shiftwidth = 2,                         -- number of spaces to use for indent
	smartindent = true,                     -- enable smartindent
	softtabstop = 2,                        -- number of spaces that a <TAB> counts for while performing editing ops
	tabstop = 2,                            -- number of spaces that a <TAB> counts for

	------------------------------------------------------------------------
	--                         Moving around lines                        --
	------------------------------------------------------------------------
	breakindent = true,                     -- enable wrapped lines to continue indent
	colorcolumn = "80",                     -- column at 80 width
	conceallevel = 2,                       -- concealed text is hidden unless it has a custom replacement char
	linebreak = true,                       -- don't break words
	number = true,                          -- print line number in front of line
	numberwidth = 2,                        -- minimal number of columns to use for line number
	relativenumber = true,                  -- show line number relative to cursor
	showbreak = "↳ ",                       -- symbol to show on wrapped lines
	whichwrap = "<,>,h,l",                  -- specify commands to wrap to another line

	------------------------------------------------------------------------
	--                         Search, vimgrep, and grep                  --
	------------------------------------------------------------------------
	ignorecase = true,                      -- ignore case when searching
	inccommand = "split",                   -- split window preview for substitution
	infercase = true,                       -- infer cases in keyword completion
	smartcase = true,                       -- try to be smart about case
}

local global = {
	loaded_node_provider = 0,               -- disable node provider
	loaded_perl_provider = 0,               -- disable Perl provider
	loaded_ruby_provider = 0,               -- disable ruby provider
	mapleader = ",",                        -- set the leader key
	maplocalleader = ",",                   -- set the local leader key
}
-- stylua: ignore end

for name, value in pairs(options) do
	vim.opt[name] = value
end

for name, value in pairs(global) do
	vim.g[name] = value
end
