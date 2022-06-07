set number relativenumber
let mapleader = " "

" No arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

inoremap jj <Esc>
nnoremap <leader>w :w<cr>
nnoremap <leader>q ZZ
nnoremap <leader>c :q

"" Move lines
nnoremap <C-j> :m +1<cr>
nnoremap <C-k> :m -2<cr>
inoremap <C-j> <Esc>:m +1<cr>
inoremap <C-k> <Esc>:m -2<cr>
