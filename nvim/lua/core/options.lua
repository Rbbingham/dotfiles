-- stylua: ignore start
------------------------------------------------------------------------
--                         General settings                           --
------------------------------------------------------------------------
vim.opt.clipboard      = "unnamedplus"            -- sync clipboard between OS and Neovim
vim.opt.completeopt    = "menuone,noselect,fuzzy" -- customize insert mode completion
vim.opt.cursorline     = true                     -- highlight text line of cursor
vim.opt.laststatus     = 3                        -- global statusline
vim.opt.nrformats      = "hex,bin,unsigned"       -- set inc/dec
vim.opt.scrolloff      = 5                        -- number of lines to keep above and below cursor
vim.opt.termguicolors  = true                     -- enable 24-bit RGB color in the TUI
vim.opt.timeoutlen     = 400                      -- time delay on <Leader> key
vim.opt.virtualedit    = "block"                  -- allow cursor to go past end of line in visual block mode

------------------------------------------------------------------------
--                         Files and backup                           --
------------------------------------------------------------------------
vim.opt.fileencoding   = "utf-8"                  -- encoding written to file
vim.opt.fileformats    = "unix"                   -- use Unix as the standard file type
vim.opt.swapfile       = false                    -- disable swap files
vim.opt.undofile       = true                     -- enable persistent undo
vim.opt.writebackup    = false                    -- prevents automatic write backup

------------------------------------------------------------------------
--                         Buffers management                         --
------------------------------------------------------------------------
vim.opt.showtabline    = 2                        -- always show tab page

------------------------------------------------------------------------
--                         Multiple windows                           --
------------------------------------------------------------------------
vim.opt.splitbelow     = true                     -- put split window below current one
vim.opt.splitright     = true                     -- put split window to the right of current one
vim.opt.winborder      = "single"                 -- border around floating window

------------------------------------------------------------------------
--                         Indentation tabs                           --
------------------------------------------------------------------------
vim.opt.copyindent     = true                     -- copy the previous indentation on autoindenting
vim.opt.list           = true                     -- don't show tabs
vim.opt.listchars      = "tab:┊ ,trail:¬"         -- set tab and end-of-line characters
vim.opt.preserveindent = true                     -- preserve indent as much as possible
vim.opt.shiftwidth     = 2                        -- number of spaces to use for indent
vim.opt.smartindent    = true                     -- enable smartindent
vim.opt.softtabstop    = 2                        -- number of spaces that a <TAB> counts for while performing editing ops
vim.opt.tabstop        = 2                        -- number of spaces that a <TAB> counts for

------------------------------------------------------------------------
--                         Moving around lines                        --
------------------------------------------------------------------------
vim.opt.breakindent    = true                     -- enable wrapped lines to continue indent
vim.opt.colorcolumn    = "80"                     -- column at 80 width
vim.opt.conceallevel   = 2                        -- concealed text is hidden unless it has a custom replacement char
vim.opt.linebreak      = true                     -- don't break words
vim.opt.number         = true                     -- print line number in front of line
vim.opt.numberwidth    = 2                        -- minimal number of columns to use for line number
vim.opt.relativenumber = true                     -- show line number relative to cursor
vim.opt.showbreak      = "↳ "                     -- symbol to show on wrapped lines
vim.opt.whichwrap      = "<,>,h,l"                -- specify commands to wrap to another line

------------------------------------------------------------------------
--                         Search,vimgrepand grep                     --
------------------------------------------------------------------------
vim.opt.ignorecase     = true                     -- ignore case when searching
vim.opt.inccommand     = "split"                  -- split window preview for substitution
vim.opt.infercase      = true                     -- infer cases in keyword completion
vim.opt.smartcase      = true                     -- try to be smart about case

vim.g.loaded_node_provider   = 0                  -- disable node provider
vim.g.loaded_perl_provider   = 0                  -- disable Perl provider
vim.g.loaded_ruby_provider   = 0                  -- disable ruby provider
vim.g.mapleader              = ","                -- set the leader key
vim.g.maplocalleader         = ","                -- set the local leader key
-- stylua: ignore end
