local keys = require("keys")

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

local function vmap(lhs, rhs, opts)
  map("v", lhs, rhs, opts)
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

-- Pase over selection but don't modify register
vmap("p", "P")
-- Swap current selection with register
vmap("P", "p")

-- split
nmap("<leader>sh", "<cmd>split<CR>")
nmap("<leader>sv", "<cmd>vsplit<CR>")

-- no search highlight
nmap("<leader><space>", "<cmd>noh<CR>")

-- quick access :w
nmap("<leader>w", vim.cmd.write)

-- maintain visual mode after shifting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- better window movement
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

nmap("<C-left>", "<C-w>h")
nmap("<C-down>", "<C-w>j")
nmap("<C-up>", "<C-w>k")
nmap("<C-right>", "<C-w>l")

-- allow ctrl+tab switch buffers
nmap("<C-Tab>", ":bnext<Enter>")
nmap("<CS-Tab>", ":bprevious<Enter>")

-- hulks
imap('<C-t>', '<Esc>:.!cat /tmp/gamestate.txt <bar> grep "time " <bar> cut -d " " -f 2<Enter>A<Space>')
nmap('<C-t>', ':.!cat /tmp/gamestate.txt <bar> grep "time " <bar> cut -d " " -f 2<Enter>A<Space>')

-- terminal mode
tmap("<Esc>", "<C-\\><C-N><Esc>")
tmap("<C-h>", "<C-\\><C-N><C-w>h")
tmap("<C-j>", "<C-\\><C-N><C-w>j")
tmap("<C-k>", "<C-\\><C-N><C-w>k")
tmap("<C-l>", "<C-\\><C-N><C-w>l")


nmap(keys.diagnostic.goto_prev, vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
nmap(keys.diagnostic.goto_next, vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
nmap(keys.diagnostic.open_float, vim.diagnostic.open_float, { desc = "Open diagnostic float" })

nmap("<Esc>", require("notify").dismiss)

local M = {}
M.map = map
M.imap = imap
M.nmap = nmap
M.vmap = vmap
M.tmap = tmap
return M
