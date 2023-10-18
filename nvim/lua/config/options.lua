local options = {
	------------------------------------------------------------------------
	--                         General settings                           --
	------------------------------------------------------------------------
	history = 100, -- lines to remember
	exrc = true, -- enable local .vimrc config
	secure = true, -- enable local .vimrc config
	mouse = "a", -- allow mouse
	timeoutlen = 500, -- time delay on <Leader> key
	ttimeoutlen = 300, -- time delay on <Leader> key
	updatetime = 300, -- update time
	nrformats = "hex,bin,unsigned", -- set inc/dec
	errorformat = "%m in %f on line %l", -- formats error messages
	showmode = false, -- don't show mode in command line
	termguicolors = true, -- enable 24-bit RGB color in the TUI
	clipboard = "unnamedplus", -- sync clipboard between OS and neovim

	------------------------------------------------------------------------
	--                         Files and backup                           --
	------------------------------------------------------------------------
	swapfile = false, -- Disable swap files
	backup = false, -- No backup (use git)
	writebackup = false, -- Prevents automatic write backup
	fileencoding = "utf-8", -- encoding written to file
	fileformats = "unix,dos,mac", -- use unix as the standard file type
	autoread = true, -- autoread a file when it is changed
	undofile = true, -- enable persistant undo

	------------------------------------------------------------------------
	--                         Buffers management                         --
	------------------------------------------------------------------------
	hidden = true, -- buffer hidden when it is abandoned
	fileignorecase = true, -- ignore case when browsing files
	switchbuf = "useopen,usetab,newtab", -- set behavior when switching between buffers
	showtabline = 2, -- show tab page when at least two tab pages

	------------------------------------------------------------------------
	--                         Multiple windows                           --
	------------------------------------------------------------------------
	winminheight = 0, -- minimal height of a window when not current window
	winminwidth = 0, -- minimal width of a window when not current window
	splitbelow = true, -- put split window below current one
	splitright = true, -- put split window to the right of current one

	------------------------------------------------------------------------
	--                         Indentation tabs                           --
	------------------------------------------------------------------------
	autoindent = true, -- enable autoindent
	smartindent = true, --enable smartindent
	preserveindent = true, -- preserve indent as much as possible
	copyindent = true, -- copy the previous indentation on autoindenting
	expandtab = false, -- use tabs, not spaces
	smarttab = true, -- be smart when using tabs
	shiftwidth = 2, -- number of spaces to use for indent
	tabstop = 2, -- number of spaces that a <TAB> counts for
	list = true, -- don't show tabs
	listchars = "tab:┊ ,trail:¬", -- set tab and end-of-line characters

	------------------------------------------------------------------------
	--                         Moving around lines                        --
	------------------------------------------------------------------------
	whichwrap = "<,>,h,l", -- specify commands to wrap to another line
	startofline = true, -- don't move cursor to the start of line
	wrap = true, -- wrap lines into the window
	linebreak = true, -- don't break words
	breakindent = true, -- enable wrapped lines to continue indent
	showbreak = "↳ ", -- symbol to show on wrapped lines
	textwidth = 0, -- stop automatic wrapping
	colorcolumn = "80", -- column at 80 width
	more = true, -- listings pause
	number = true, -- print line number in front of line
	numberwidth = 2, -- minimal number of columns to use for line number
	relativenumber = true, -- show line number relative to cursor
	conceallevel = 2, -- concealed text is hidden unless it has a custom replacement char
	foldlevel = 99, -- fold at 4 levels
	foldlevelstart = 99, -- start with all code unfolded
	foldmethod = "expr", -- use expression for folding (Treesitter handles it)
	foldnestmax = 3, -- maxmimum nesting of folds for 'indent' and 'syntax' methods
	foldminlines = 1, -- number of screen lines above which a fold can be displayed

	------------------------------------------------------------------------
	--                         Search, vimgrep, and grep                  --
	------------------------------------------------------------------------
	hlsearch = true, -- highlight search results
	incsearch = true, -- show where the pattern, as typed, matches
	wrapscan = true, -- search, wrap around the end of the buffer
	ignorecase = true, -- ignore case when searching
	infercase = true, -- infer cases in keyword completion
	smartcase = true, -- try to be smart about case
	magic = true, -- allow regular expressions
	maxmempattern = 1000, -- maxmimum amount of memory in Kbyte used for pattern matching
	grepprg = "grep -nHi", -- program to use for grep
}

local global = {
	mapleader = ",", -- set the leader key
	maplocalleader = ",", -- set the local leader key
	-- max_file = { size = 1024 * 100, lines = 10000 }, -- set global limits for large files
	-- autoformat_enabled = true, -- enable autoformatting
	-- autopairs_enabled = true, -- enable autopairs at start
	-- cmp_enabled = true, -- enable completion at start
	-- codelens_enabled = true, -- enable or disable automatic codelens refreshing for lsp that support it
	-- diagnostics_enabled = 3, -- set the visibility of diagnostics
 	-- highlighturl_enabled = true, -- highlight URLs by default
	-- icons_enabled = true, -- disable icons in the UI
	-- inlay_hints_enabled = false, -- enable or disable LSP inlay hints on startup
	-- lsp_handlers_enabled = true, -- enable or disable default vim.lsp.handlers
	-- semantic_tokens_enabled = true, -- enable or disable LSP semantic tokens on startup
	-- ui_notifications_enabled = true, -- disable notifications
	-- git_worktrees = nil, -- enable git integration for detached worktrees
}

for name, value in pairs(options) do
	vim.opt[name] = value
end

for name, value in pairs(global) do
	vim.g[name] = value
end
