call plug#begin('~/.config/nvim/plugged')
Plug 'ap/vim-css-color'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

set encoding=UTF-8

syntax on

set number relativenumber
set cursorline
set cmdheight=1
set shiftwidth=2
set hls is

"statusline
set statusline=
set statusline+=\ %M
set statusline+=\ %y
set statusline+=\ %r
set statusline+=\ %F
set statusline+=%= "Right side settings
set statusline+=\ %c:%l/%L
set statusline+=\ %p%%
set statusline+=\ [%n]
