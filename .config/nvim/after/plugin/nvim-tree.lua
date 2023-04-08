local nmap = require("keymap").nmap

nmap("<leader>nt", require("nvim-tree.api").tree.toggle)
