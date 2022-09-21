vim.cmd([[
" Remember cursor position
augroup remember_cursor_position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

augroup auto_insert_terminal
    autocmd TermOpen * :startinsert
augroup END
]])
