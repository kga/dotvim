set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'itchyny/lightline.vim'
Plugin 'tomasr/molokai'

Plugin 'vim-perl/vim-perl'

call vundle#end()

filetype plugin indent on
syntax on

colorscheme molokai

set nobackup
set directory=~/.vim/swp
set ruler
set number

set backspace=indent,eol,start

set list
set listchars=tab:>\ ,trail:-
set scrolloff=10
set display=lastline
set foldenable
set foldmethod=marker

set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set wildmode=list:longest,full
set wildmenu

set modelines=0
set autoindent

set ignorecase
set smartcase
set wrapscan
set hlsearch
set noincsearch

set showcmd
set showmatch
set matchpairs+=<:>

set laststatus=2
set ambiwidth=double
set hidden

set completeopt=menuone

set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932,ucs-bom,utf-16,utf-16le

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <silent> <Space>/ :nohlsearch<CR>
nnoremap <expr> 0 col('.') == 1 ? '^' : '0'

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
