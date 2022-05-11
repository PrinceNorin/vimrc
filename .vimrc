call plug#begin("~/.vim/plugged")

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'

" Colorschemes
Plug 'ackyshake/Spacegray.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'yuttie/sublimetext-spacegray.vim'

" Language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

syntax enable
filetype on
filetype plugin on

" Disable compatibility with vi
set nocompatible

" Always unicode
set encoding=utf-8

" Show line number
set nu

" Global tab setting
set et
set ts=2
set sw=2
set sts=2

" Show invisible
set list lcs=trail:·,tab:»·

" Colorscheme
set termguicolors
set background=dark
colorscheme palenight

" Swap, backup and undo path
set backupdir=~/.vim/swapfiles/
set directory=~/.vim/swapfiles/
set undodir=~/.vim/swapfiles/

" Key mapping
let mapleader=","
inoremap jj <esc>

" Quick save, quit
nnoremap <leader>w :w<cr>
nnoremap <leader>qq :qa<cr>

" Buffer key map
nnoremap <leader>vs :vs<cr>
nnoremap <leader>hs :sp<cr>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <leader>cb :bd<cr>

" Airline theme
let g:airline_theme="palenight"

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|(__pycache__|node_modules|dist|deps|_rel|_build))$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" Palenight
let g:palenight_terminal_italics=1

" Coc
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
