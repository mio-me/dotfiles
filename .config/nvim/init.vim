call plug#begin('~/.config/nvim/plugged')

" Theme
Plug 'ap/vim-css-color'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'folke/which-key.nvim'

call plug#end()

set encoding=UTF-8

syntax on

set number relativenumber
" set cursorline
set cmdheight=1
set shiftwidth=2
set hls is

let mapleader=" "

" No arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Windows like shortcuts
nnoremap <c-s> :w<cr>
nnoremap <c-q> :q<cr>
" TODO: open, cut, copy, paste, search

" Left and Right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

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

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
require('telescope').setup{
  prompt_prefix = ""
}
require('which-key').setup {}
EOF
