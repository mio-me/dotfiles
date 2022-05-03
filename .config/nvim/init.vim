call plug#begin('~/.config/nvim/plugged')

" Theme
Plug 'ap/vim-css-color'
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'


" Semantic language support
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'hrsh7th/cmp-path', {'branch': 'main'}
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'ray-x/lsp_signature.nvim'

" Only because nvim-cmp _requires_ snippets
Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'}
Plug 'hrsh7th/vim-vsnip'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" QoL
Plug 'folke/which-key.nvim'

" Basic 
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'



call plug#end()

set encoding=UTF-8

syntax on

set number relativenumber
set cursorline
set cmdheight=1
set shiftwidth=2
set hls is

let mapleader=" "

" No arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

inoremap jj <Esc>
nnoremap <leader>w :w<cr>
nnoremap <leader>q ZZ
nnoremap <leader>c :q

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
