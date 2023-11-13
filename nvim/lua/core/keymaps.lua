local map = vim.keymap.set

-- better up/down
map({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Navigate in insert mode
map("i", "<C-h>", "<Left>", { desc = "Move left", remap = true })
map("i", "<C-l>", "<Right>", { desc = "Move right", remap = true })
map("i", "<C-j>", "<Down>", { desc = "Move down", remap = true })
map("i", "<C-k>", "<Up>", { desc = "Move up", remap = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<Leader>bn", "<cmd>enew<CR>", { desc = "New buffer" })
map("n", "<Leader>bs", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
map("n", "<esc>", "<cmd>noh<cr>", { desc = "Escape and clear hlsearch" })

-- Save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })

-- Better indenting
map("n", "<TAB>", ">>")
map("n", "<S-TAB>", "<<")
map("v", "<TAB>", ">gv")
map("v", "<S-TAB>", "<gv")

-- Next and prev centered
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- Nvim-tree toggle and focus
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Nvimtree" })
map("n", "<Leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus Nvimtree" })

-- Toggle spellchecking
map("n", "<F7>", ":setlocal spell!<CR>", { desc = "Toggle spell-checking" })

-- Don't copy the replaced text after pasting in visual mode
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Don't copy replaced text", silent = true })
