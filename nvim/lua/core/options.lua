local options = {
	------------------------------------------------------------------------
	--                         General settings                           --
	------------------------------------------------------------------------
	history = 100, -- lines to remember
	mouse = "a", -- allow mouse
	timeoutlen = 400, -- time delay on <Leader> key
	updatetime = 250, -- update time
	nrformats = "hex,bin,unsigned", -- set inc/dec
	termguicolors = true, -- enable 24-bit RGB color in the TUI
	clipboard = "unnamedplus", -- sync clipboard between OS and neovim
	cursorline = true, -- highlight text line of cursor
	laststatus = 3, -- global statusline

	------------------------------------------------------------------------
	--                         Files and backup                           --
	------------------------------------------------------------------------
	swapfile = false, -- Disable swap files
	backup = false, -- No backup (use git)
	writebackup = false, -- Prevents automatic write backup
	fileencoding = "utf-8", -- encoding written to file
	fileformats = "unix", -- use unix as the standard file type
	autoread = true, -- autoread a file when it is changed
	undofile = true, -- enable persistant undo

	------------------------------------------------------------------------
	--                         Buffers management                         --
	------------------------------------------------------------------------
	hidden = true, -- buffer hidden when it is abandoned
	switchbuf = "useopen,usetab,newtab", -- set behavior when switching between buffers
	showtabline = 2, -- always show tab page

	------------------------------------------------------------------------
	--                         Multiple windows                           --
	------------------------------------------------------------------------
	splitbelow = true, -- put split window below current one
	splitright = true, -- put split window to the right of current one

	------------------------------------------------------------------------
	--                         Indentation tabs                           --
	------------------------------------------------------------------------
	autoindent = true, -- enable autoindent
	smartindent = true, --enable smartindent
	preserveindent = true, -- preserve indent as much as possible
	copyindent = true, -- copy the previous indentation on autoindenting
	expandtab = false, -- use tabs instead of spaces
	smarttab = true, -- be smart when using tabs
	shiftwidth = 2, -- number of spaces to use for indent
	tabstop = 2, -- number of spaces that a <TAB> counts for
	softtabstop = 2, -- number of spaces that a <TAB> counts for while performing editing ops
	list = true, -- don't show tabs
	listchars = "tab:┊ ,trail:¬", -- set tab and end-of-line characters

	------------------------------------------------------------------------
	--                         Moving around lines                        --
	------------------------------------------------------------------------
	whichwrap = "<,>,h,l", -- specify commands to wrap to another line
	wrap = true, -- wrap lines into the window
	linebreak = true, -- don't break words
	breakindent = true, -- enable wrapped lines to continue indent
	showbreak = "↳ ", -- symbol to show on wrapped lines
	colorcolumn = "80", -- column at 80 width
	number = true, -- print line number in front of line
	numberwidth = 2, -- minimal number of columns to use for line number
	relativenumber = true, -- show line number relative to cursor
	conceallevel = 2, -- concealed text is hidden unless it has a custom replacement char

	------------------------------------------------------------------------
	--                         Search, vimgrep, and grep                  --
	------------------------------------------------------------------------
	hlsearch = true, -- highlight search results
	incsearch = true, -- show where the pattern, as typed, matches
	inccommand = "split", -- split window preview for substitution
	wrapscan = true, -- search, wrap around the end of the buffer
	ignorecase = true, -- ignore case when searching
	infercase = true, -- infer cases in keyword completion
	smartcase = true, -- try to be smart about case
	magic = true, -- allow regular expressions
}

local global = {
	mapleader = ",", -- set the leader key
	maplocalleader = ",", -- set the local leader key
	loaded_ruby_provider = 0, -- disable ruby provider
	loaded_node_provider = 0, -- disable node provider
	loaded_perl_provider = 0, -- disable perl provider
	load_doxygen_syntax = 1,
	doxygen_enhanced_color = 1,
}

for name, value in pairs(options) do
	vim.opt[name] = value
end

for name, value in pairs(global) do
	vim.g[name] = value
end
