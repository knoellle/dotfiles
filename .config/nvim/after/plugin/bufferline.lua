local bufferline = require("bufferline")

bufferline.setup({
	options = {
		diagnostics = "nvim_lsp",
		show_buffer_close_icons = false,
		show_close_icon = false,
		separator_style = "slant",
	},
})

-- mappings
local nmap = require("keymap").nmap
local tmap = require("keymap").tmap

nmap("<leader>j", function()
	bufferline.cycle(-1)
end)
nmap("<leader>k", function()
	bufferline.cycle(1)
end)
nmap("<leader>J", function()
	bufferline.move(-1)
end)
nmap("<leader>K", function()
	bufferline.move(1)
end)

-- Maps Alt+digit
nmap("<M-1>", function() bufferline.go_to_buffer(1, true) end)
nmap("<M-2>", function() bufferline.go_to_buffer(2, true) end)
nmap("<M-3>", function() bufferline.go_to_buffer(3, true) end)
nmap("<M-4>", function() bufferline.go_to_buffer(4, true) end)
nmap("<M-5>", function() bufferline.go_to_buffer(5, true) end)
nmap("<M-6>", function() bufferline.go_to_buffer(6, true) end)
nmap("<M-7>", function() bufferline.go_to_buffer(7, true) end)
nmap("<M-8>", function() bufferline.go_to_buffer(8, true) end)
nmap("<M-9>", function() bufferline.go_to_buffer(9, true) end)
tmap("<M-1>", function() bufferline.go_to_buffer(1, true) end)
tmap("<M-2>", function() bufferline.go_to_buffer(2, true) end)
tmap("<M-3>", function() bufferline.go_to_buffer(3, true) end)
tmap("<M-4>", function() bufferline.go_to_buffer(4, true) end)
tmap("<M-5>", function() bufferline.go_to_buffer(5, true) end)
tmap("<M-6>", function() bufferline.go_to_buffer(6, true) end)
tmap("<M-7>", function() bufferline.go_to_buffer(7, true) end)
tmap("<M-8>", function() bufferline.go_to_buffer(8, true) end)
tmap("<M-9>", function() bufferline.go_to_buffer(9, true) end)

nmap("<C-s>", "<cmd>BufferLinePick<CR>")
