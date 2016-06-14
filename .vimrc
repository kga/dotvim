set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/ctrlp-ghq'

Plugin 'tpope/vim-fugitive'

Plugin 'itchyny/lightline.vim'
Plugin 'tomasr/molokai'
Plugin 'xoria256.vim'

Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

Plugin 'vim-perl/vim-perl'
Plugin 'fatih/vim-go'
Plugin 'leafgarland/typescript-vim'
Plugin 'derekwyatt/vim-scala'

Plugin 'nginx.vim'

let g:loaded_matchparen = 1
Plugin 'itchyny/vim-parenmatch'

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

set showtabline=2

set completeopt=menuone

set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932,ucs-bom,utf-16,utf-16le

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

cnoremap <C-a> <Home>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

nnoremap <silent> <Space>/ :nohlsearch<CR>
nnoremap <expr> 0 col('.') == 1 ? '^' : '0'

autocmd QuickFixCmdPost *grep* cwindow

" {{{ Tab
nnoremap [Tag] <Nop>
nmap     t     [Tag]

for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

map <silent> [Tag]c :tablast <bar> tabnew<CR>
map <silent> [Tag]d :tabclose<CR>
map <silent> [Tag]n :tabnext<CR>
map <silent> [Tag]p :tabprevious<CR>
" }}}

" Plugin settings

" vim-go
let g:go_fmt_command = "goimports"

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" {{{ CtrlP
let g:ctrlp_max_depth = 10
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files']
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_map = '<Nop>'

nnoremap [ctrlp] <Nop>
nmap     f       [ctrlp]

nnoremap <silent> [ctrlp]f :<C-u>CtrlP<CR>
nnoremap <silent> [ctrlp]b :<C-u>CtrlPBuffer<CR>
nnoremap <silent> [ctrlp]m :<C-u>CtrlPMRUFiles<CR>
nnoremap <silent> [ctrlp]g :<C-u>CtrlPGhq<CR>
" }}}

" {{{ neocomplete
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Set minimum syntax keyword length.
let g:neocomplete#min_keyword_length = 2

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : ''
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl =
\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

" http://hakobe932.hatenablog.com/entry/2014/01/21/214100
if !exists('g:neocomplete#delimiter_patterns')
  let g:neocomplete#delimiter_patterns = {}
endif
let g:neocomplete#delimiter_patterns.perl = []

let g:neosnippet#snippets_directory = '~/.vim/snippets/'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" }}}

autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
