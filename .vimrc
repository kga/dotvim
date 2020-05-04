set nocompatible
filetype off

call plug#begin()

Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/ctrlp-ghq'

Plug 'tpope/vim-fugitive'

Plug 'itchyny/lightline.vim'
Plug 'tomasr/molokai'
Plug 'arcticicestudio/nord-vim'

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'prabirshrestha/asyncomplete-neosnippet.vim'

Plug 'thinca/vim-quickrun'
Plug 'tyru/current-func-info.vim'

Plug 'vim-perl/vim-perl'
Plug 'hotchpotch/perldoc-vim'
Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'

Plug 'majutsushi/tagbar'

let g:loaded_matchparen = 1
Plug 'itchyny/vim-parenmatch'

Plug 'junegunn/vim-easy-align'

" language server
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

filetype plugin indent on
syntax on

colorscheme nord

set nobackup
set directory=~/.vim/swp
set ruler
set nonumber

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
set breakindent

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
"let g:go_fmt_command = "goimports"

" {{{ lightline
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ],
      \             [ 'fugitive' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [],
      \             [ 'relativepath' ] ],
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'mode':     'LightLineMode'
      \ }
      \ }

function! LightLineFugitive()
  if exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightLineMode()
  return  &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction
" }}}

" {{{ CtrlP
let g:ctrlp_max_depth = 10
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files']
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_mruf_max = 100
let g:ctrlp_map = '<Nop>'

nnoremap [ctrlp] <Nop>
nmap     f       [ctrlp]

nnoremap <silent> [ctrlp]f :<C-u>CtrlP<CR>
nnoremap <silent> [ctrlp]b :<C-u>CtrlPBuffer<CR>
nnoremap <silent> [ctrlp]m :<C-u>CtrlPMRUFiles<CR>
nnoremap <silent> [ctrlp]g :<C-u>CtrlPGhq<CR>
" }}}

call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
    \ 'name': 'neosnippet',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
    \ }))

let g:neosnippet#snippets_directory = '~/.vim/snippets/'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" {{{ EasyAligh
vmap <Enter> <Plug>(EasyAlign)
" }}}

autocmd FileType go nmap <Leader>gd <Plug>(go-doc)

" {{{ QuickRun
let g:quickrun_config = {}
let g:quickrun_config['prove/carton'] = {
      \ 'exec'    : 'carton exec -- %c %o -v %s',
      \ 'command' : 'prove',
      \ }
let g:quickrun_config['prove/carton/contextual'] = extend(g:quickrun_config['prove/carton'], {
      \ 'exec' : 'TEST_METHOD=%a ' . g:quickrun_config['prove/carton'].exec,
      \ })

command! Prove call s:prove()
function! s:prove()
  let func_name = cfi#format('%s', '')
  if func_name == ''
    QuickRun prove/carton
  else
    execute 'QuickRun prove/carton/contextual -args ' . func_name
  endif
endfunction

nnoremap <Leader>p :Prove<CR>
" }}}

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
