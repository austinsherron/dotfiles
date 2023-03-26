" general settings
set nu
set ai
set si
set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
set incsearch
set hlsearch
set ruler
set clipboard=unnamed
syntax on

nnoremap <Space> <Nop>

let mapleader = ' '
let maplocalleader = ' '

" for switching between windows easily (doesn't work in tmux)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-l> <C-w>l

" remap escape key
nnoremap <C-c> <Esc>

" easier mappings for misc. interactions (i.e.: buffers, saving, quitting, etc.)
map <leader>bn :bn<cr>
map <leader>bp :bp<cr>
map <leader>bd :bd<cr>

map <leader>w :w<cr>
map <leader>q :q<cr>
map <leader>W :wq<cr>
map <leader>Q :q!<cr>

" j/k scrolling for popup menu nav (instead of up/down arrows)
inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
inoremap <expr> k pumvisible() ? "\<C-P>" : "k"

" toggle relative line numbers w/ ctrl+l x2
nmap <C-L><C-L> :set invrelativenumber<CR>
 
" shortcuts for various plugins
command NE NERDTreeToggle	
command TT TagbarToggle

nmap <leader>ff :NE<CR>

" lets supertab and snipmate play nicely
let g:SuperTabDefaultCompletionType = "context"

" pathogen
"" disabled plugins"
let g:pathogen_disabled = ['auto-pairs']

"" init"
execute pathogen#infect()

" syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" easymotion leader remap
map \ <Plug>(easymotion-prefix)

" colors!
" colorscheme elflord
colorscheme wombat256mod

" commentary comment strings
" autocmd FileType *.lua

" open NERDTree when opening vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTreeToggle | endif

set commentstring=#\ %s

