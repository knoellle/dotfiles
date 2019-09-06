" The future is now
set nocompatible

" Directories for swp files
set nobackup
set nowritebackup
set noswapfile

" Enable hidden buffers
set hidden

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Misc
let mapleader =" "
filetype on
syntax on
set encoding=utf-8
set ignorecase

set updatetime=300

" System Interaction
set mouse=a
set clipboard=unnamedplus

call plug#begin('~/.config/nvim/plugged')

" Base16
Plug 'chriskempson/base16-vim'

" Auto completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Commenting
Plug 'tpope/vim-commentary'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Deletion of surrounding brackets
Plug 'tpope/vim-surround'

" Git integration
Plug 'tpope/vim-fugitive'

" Live git diff
Plug 'airblade/vim-gitgutter'

" Fuzzysearch
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Clang-format
Plug 'rhysd/vim-clang-format'

" Python format
Plug 'tell-k/vim-autopep8'

" Detect tab width from buffer
Plug 'ciaranm/detectindent'

" Gay parentheses
Plug 'luochen1990/rainbow'

" Start a * or # search from a visual block
Plug 'nelstrom/vim-visual-star-search'

"Creates sidebar that displays the ctags-generated tags of the current file, ordered by their scope.
Plug 'majutsushi/tagbar'
let g:tagbar_autofocus = 1
nnoremap <silent> <F4> :TagbarToggle<CR>

" Python semantic highlighting
Plug 'numirias/semshi', { 'for': 'python', 'do': ':UpdateRemotePlugins' } " Options "
let g:semshi#mark_selected_nodes = 0
nnoremap <leader>rW :Semshi rename

" coc.nvim
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> <c-space> <Plug>(coc-diagnostic-info)

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>qf <Plug>(coc-fix-current)

nmap <silent> <leader>f :call CocAction('format')<CR>

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

Plug 'metakirby5/codi.vim'

call plug#end()

" Visuals
highlight Visual cterm=standout ctermfg=None ctermbg=None
let g:airline_powerline_fonts = 1
" let g:airline_left_sep='>'
let g:rainbow_active = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" " unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'

" Colors
set termguicolors
let base16colorspace=256
colorscheme base16-monokai

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=10

" Tab settings
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

" Highlight tabs and trailing spaces
set listchars=tab:▸-,trail:¬
set list

" Linenumbers
set number
set relativenumber
set numberwidth=5
set cursorline
set cursorcolumn

" Autocompletion
set wildmode=longest,list,full

" Sane default splitting
set splitbelow splitright

" FZF
map <C-f> :tabedit<CR>:FZF<CR>

" Replace all is aliased to S
nnoremap S :%s//g<Left><Left>

" Clear highlight on pressing escape
nnoremap <esc> :noh<return><esc>

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["~/.config/nvim/bundle/vim-snippets/UltiSnips", "UltiSnips"]
if getcwd() =~ "nao"
  call add(g:UltiSnipsSnippetDirectories,'~/hulks/nao/tools/IDEPlugins/NaoSnippets')
endif

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 100
inoremap <expr><tab>   pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
inoremap <expr><cr>    pumvisible() ? "\<c-y>" : "\<cr>"

" Center result after search repeat
nnoremap n nzz
nnoremap N Nzz

" Navigate properly when lines are wrapped
map <silent> j gj
map <silent> k gk

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" toggle source header function
function ToggleSourceHeader()
    let extension = expand('%:e')
    if(extension == "hpp")
        let file = expand('%:r') . '.cpp'
        if filereadable(file)
            execute ":e %:r.cpp"
        endif
    elseif(extension == "h")
        let file = expand('%:r') . '.cpp'
        if filereadable(file)
            execute ":e %:r.cpp"
        endif
    elseif(extension == "cpp")
        let file = expand('%:r') . '.hpp'
        if filereadable(file)
            execute ":e %:r.hpp"
        endif
        let file = expand('%:r') . '.h'
        if filereadable(file)
            execute ":e %:r.h"
        endif
     endif
endfunc
noremap <leader>s :exec ToggleSourceHeader()<Enter>

" Buffers
nnoremap <silent> <leader>b :Buffers<CR>
noremap <leader>j :bp<CR>
noremap <leader>k :bn<CR>
noremap <leader>c :bd<CR>

" Tabs
nnoremap <leader>l gt
nnoremap <leader>h gT
nnoremap <silent><leader>t :tabnew<CR>
nnoremap <leader>x :tabclose<CR>

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Automatically detect indent styles
autocmd BufReadPost * :DetectIndent

" highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" " Navigating with guides
" inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
" vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
" map <leader><leader> <Esc>/<++><Enter>"_c4l

" " MARKDOWN
" autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
" autocmd Filetype markdown,rmd inoremap <leader>n ---<Enter><Enter>
" autocmd Filetype markdown,rmd inoremap <leader>b ****<++><Esc>F*hi
" autocmd Filetype markdown,rmd inoremap <leader>s ~~~~<++><Esc>F~hi
" autocmd Filetype markdown,rmd inoremap <leader>e **<++><Esc>F*i
" autocmd Filetype markdown,rmd inoremap <leader>h ====<Space><++><Esc>F=hi
" autocmd Filetype markdown,rmd inoremap <leader>i ![](<++>)<++><Esc>F[a
" autocmd Filetype markdown,rmd inoremap <leader>a [](<++>)<++><Esc>F[a
" autocmd Filetype markdown,rmd inoremap <leader>1 #<Space><Enter><++><Esc>kA
" autocmd Filetype markdown,rmd inoremap <leader>2 ##<Space><Enter><++><Esc>kA
" autocmd Filetype markdown,rmd inoremap <leader>3 ###<Space><Enter><++><Esc>kA
" autocmd Filetype markdown,rmd inoremap <leader>t <Esc>:.!cat /tmp/gamestate.txt <bar> grep time <bar> cut -d " " -f 2<Enter>A<Space>
" autocmd Filetype markdown,rmd nnoremap <leader>t :.!cat /tmp/gamestate.txt <bar> grep time <bar> cut -d " " -f 2<Enter>A<Space>

