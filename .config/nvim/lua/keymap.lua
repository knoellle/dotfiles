local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

local function imap(lhs, rhs, opts)
	map("i", lhs, rhs, opts)
end

local function nmap(lhs, rhs, opts)
	map("n", lhs, rhs, opts)
end

local function tmap(lhs, rhs, opts)
	map("t", lhs, rhs, opts)
end

-- Map leader to space
vim.g.mapleader = " "

-- navigate properly when lines are wrapped
map("", "j", "gj")
map("", "k", "gk")

-- Copy to clipboard in normal, visual, select and operator modes
map("", "<leader>y", '"+y')
map("", "<leader>Y", '"+yg_')
map("", "<leader>p", '"+p')
map("", "<leader>P", '"+P')

-- split
nmap("<leader>sh", "<cmd>split<CR>")
nmap("<leader>sv", "<cmd>vsplit<CR>")

-- no search highlight
nmap("<leader><space>", "<cmd>noh<CR>")

-- maintain visual mode after shifting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- better window movement
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- hulks
imap('<C-t>', '<Esc>:.!cat /tmp/gamestate.txt <bar> grep "time " <bar> cut -d " " -f 2<Enter>A<Space>')
nmap('<C-t>', ':.!cat /tmp/gamestate.txt <bar> grep "time " <bar> cut -d " " -f 2<Enter>A<Space>')

-- rust
nmap("<leader>i", ':lua require("rust-tools.inlay_hints").toggle_inlay_hints()<Enter>')

-- terminal mode
tmap("<Esc>", "<C-\\><C-N><Esc>")
tmap("<C-h>", "<C-\\><C-N><C-w>h")
tmap("<C-j>", "<C-\\><C-N><C-w>j")
tmap("<C-k>", "<C-\\><C-N><C-w>k")
tmap("<C-l>", "<C-\\><C-N><C-w>l")

local M = {}
M.map = map
M.imap = imap
M.nmap = nmap
M.tmap = tmap
return M
