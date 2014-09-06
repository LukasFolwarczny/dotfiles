set encoding=utf-8
set fileencodings=utf-8,cp1250,latin2,iso-8859-2

colorscheme desert
syntax on

set nocompatible
set showcmd

set textwidth=90

set smarttab
set smartindent
set tabstop=4
set shiftwidth=4

set ignorecase
set smartcase
set hlsearch
set incsearch

highlight Search cterm=NONE ctermfg=black ctermbg=white
highlight Incsearch cterm=NONE ctermfg=black ctermbg=white

set undofile
set undodir=~/.vim/undodir

nmap <F11> :w<CR>:make!<CR>
