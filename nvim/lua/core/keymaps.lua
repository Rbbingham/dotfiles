local map = vim.keymap.set

-- better up/down
map({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- navigate in insert mode
map("i", "<C-h>", "<Left>", { desc = "Move left", remap = true })
map("i", "<C-l>", "<Right>", { desc = "Move right", remap = true })
map("i", "<C-j>", "<Down>", { desc = "Move down", remap = true })
map("i", "<C-k>", "<Up>", { desc = "Move up", remap = true })

-- move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- move lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<Leader>b", "<cmd>enew<CR>", { desc = "New buffer" })

-- clear search with <esc>
map("n", "<esc>", "<cmd>noh<cr>", { desc = "Escape and clear hlsearch" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })

-- better indenting
map("n", "<TAB>", ">>")
map("n", "<S-TAB>", "<<")
map("v", "<TAB>", ">gv")
map("v", "<S-TAB>", "<gv")

-- keep the jumplist binding
map("n", "<C-I>", "<C-I>")

-- next and prev centered
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- toggle spellchecking
map("n", "<F7>", ":setlocal spell!<CR>", { desc = "Toggle spell-checking" })

-- exact substitution
map("n", "<F5>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Exact substitution" })

-- don't copy the replaced text after pasting in visual mode
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Don't copy replaced text", silent = true })

-- add buffer diagnostics to the location/quickfix list.
map("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "LSP [D]iagnostic [L]oclist" })
map("n", "<leader>dq", vim.diagnostic.setqflist, { desc = "LSP [D]iagnostic [Q]uicklist" })

-- terminal keybindings
map("n", "<F6>", ":terminal<CR>", { desc = "Open terminal" })
map("t", "<esc>", "<C-\\><C-n>", { silent = true })

--------------------------------- Plugins Keymaps ----------------------------------
-- oil
map("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })

-- general mappings
map("n", "<leader><space>", "<cmd>FzfLua buffers<CR>", { desc = "[ ] Find existing buffers" })
map("n", "<leader>?", "<cmd>FzfLua oldfiles<CR>", { desc = "[?] Find recently opened files" })
map("n", "<leader>/", "<cmd>FzfLua blines<CR>", { desc = "[/] Fuzzily search in current buffer" })

-- search mappings
map("n", "<leader>sd", "<cmd>FzfLua diagnostics_workspace<CR>", { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>sf", "<cmd>FzfLua files<CR>", { desc = "[S]earch [F]iles" })
map("n", "<leader>sg", "<cmd>FzfLua live_grep<CR>", { desc = "[S]earch by [G]rep" })
map("n", "<leader>sh", "<cmd>FzfLua helptags<CR>", { desc = "[S]earch [H]elp" })
map("n", "<leader>sr", "<cmd>FzfLua resume<CR>", { desc = "[S]earch [R]esume" })
map("n", "<leader>sw", "<cmd>FzfLua grep_cword<CR>", { desc = "[S]earch [W]ord" })
map("n", "<leader>sW", "<cmd>FzfLua grep_cWORD<CR>", { desc = "[S]earch [W]ord" })
map(
	"n",
	"<leader>sa",
	"<cmd>FzfLua files hidden=true follow=true no_ignore=true<CR>",
	{ desc = "[S]earch [A]ll files" }
)
map("n", "<leader>sq", "<cmd>FzfLua quickfix<CR>", { desc = "[S]earch [Q]uickfix list" })
map("n", "<leader>sl", "<cmd>FzfLua loclist<CR>", { desc = "[S]earch [L]ocation list" })

-- git mappings
map("n", "<leader>gf", "<cmd>FzfLua git_files<CR>", { desc = "Search [G]it [F]iles" })
map("n", "<leader>gb", "<cmd>FzfLua git_branches<CR>", { desc = "Search [G]it [B]ranches" })
map("n", "<leader>gc", "<cmd>FzfLua git_commits<CR>", { desc = "Search [G]it [C]ommits" })
map("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview [G]it [H]unk" })
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "[G]it [S]tage hunk" })
map("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>", { desc = "[G]it [S]tage buffer" })
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "[G]it [R]eset hunk" })
map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "[G]it [R]eset buffer" })

map("v", "<leader>gs", function()
	require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "[G]it [S]tage hunk" })

map("v", "<leader>gr", function()
	require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "[G]it [R]eset hunk" })

-- nvim-treesitter-textobjects keymaps
local textobjects = require("nvim-treesitter-textobjects.select")
vim.keymap.set({ "x", "o" }, "aa", function()
	textobjects.select_textobject("@parameter.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ia", function()
	textobjects.select_textobject("@parameter.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "af", function()
	textobjects.select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "if", function()
	textobjects.select_textobject("@function.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ac", function()
	textobjects.select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ic", function()
	textobjects.select_textobject("@class.inner", "textobjects")
end)

vim.keymap.set("n", "<leader>a", function()
	require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
end)
vim.keymap.set("n", "<leader>A", function()
	require("nvim-treesitter-textobjects.swap").swap_next "@parameter.outer"
end)

local textobjects_move = require("nvim-treesitter-textobjects.move")
vim.keymap.set({ "n", "x", "o" }, "]m", function()
	textobjects_move.goto_next_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]]", function()
	textobjects_move.goto_next_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]M", function()
	textobjects_move.goto_next_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "][", function()
	textobjects_move.goto_next_end("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[m", function()
	textobjects_move.goto_previous_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[[", function()
	textobjects_move.goto_previous_start("@class.outer", "textobjects")
end)
