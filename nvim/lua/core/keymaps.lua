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
map("n", "<leader><space>", "<cmd>Telescope buffers<CR>", { desc = "[ ] Find existing buffers" })
map("n", "<leader>?", "<cmd>Telescope oldfiles<CR>", { desc = "[?] Find recently opened files" })
map(
	"n",
	"<leader>/",
	"<cmd>Telescope current_buffer_fuzzy_finder<CR>",
	{ desc = "[/] Fuzzily search in current buffer" }
)

-- search mappings
map("n", "<leader>sd", "<cmd>Telescope diagnostics<CR>", { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "[S]earch [F]iles" })
map("n", "<leader>sg", "<cmd>Telescope live_grep<CR>", { desc = "[S]earch by [G]rep" })
map("n", "<leader>sh", "<cmd>Telescope help_tags<CR>", { desc = "[S]earch [H]elp" })
map("n", "<leader>sr", "<cmd>Telescope resume<CR>", { desc = "[S]earch [R]esume" })
map("n", "<leader>sw", "<cmd>Telescope grep_string<CR>", { desc = "[S]earch current [W]ord" })
map(
	"n",
	"<leader>sa",
	"<cmd>Telescope find_files hidden=true follow=true no_ignore=true<CR>",
	{ desc = "[S]earch [A]ll files" }
)

-- git mappings
map("n", "<leader>gf", "<cmd>Telescope git_files<CR>", { desc = "Search [G]it [F]iles" })
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Search [G]it [B]ranches" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Search [G]it [C]ommits" })
map("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview [G]it [H]unk" })
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "[G]it [S]tage hunk" })
map("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>", { desc = "[G]it [S]tage buffer" })
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "[G]it [R]eset hunk" })
map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "[G]it [R]eset buffer" })

map("v", "<leader>gs", function()
	require("gitsigns").stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
end, { desc = "[G]it [S]tage hunk" })

map("v", "<leader>gr", function()
	require("gitsigns").reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
end, { desc = "[G]it [R]eset hunk" })

-- telekasten keymaps
map("n", "<leader>zl", "<cmd>Telekasten insert_link<CR>", { desc = "[Z]ettelkasten insert [L]ink" })
map("n", "<leader>zi", "<cmd>Telekasten insert_img_link<CR>", { desc = "[Z]ettelkasten insert [I]mg link" })
map("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>", { desc = "[Z]ettelkasten show [B]acklinks" })
map("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>", { desc = "[Z]ettelkasten show [C]alender" })
map("n", "<leader>zn", "<cmd>Telekasten new_note<CR>", { desc = "[Z]ettelkasten new [N]ote" })
map("n", "<leader>zg", "<cmd>Telekasten follow_link<CR>", { desc = "[Z]ettelkasten [G]oto note" })
map("n", "<leader>zt", "<cmd>Telekasten goto_today<CR>", { desc = "[Z]ettelkasten goto [T]oday" })
map("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>", { desc = "[Z]ettelkasten [F]ind note" })
map("n", "<leader>z", "<cmd>Telekasten panel<CR>", { desc = "[Z]ettelkasten" })
