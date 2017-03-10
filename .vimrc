if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
endif

set runtimepath+=/Users/harry/.vim/repos/github.com/Shougo/dein.vim/

call plug#begin('~/.vim/plugins')

" Functionality
Plug 'editorconfig/editorconfig-vim'
Plug 'Raimondi/delimitMate'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'suan/vim-instant-markdown'
Plug 'junegunn/goyo.vim'
Plug 'easymotion/vim-easymotion'

" Language support
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-liquid'

" Interface
Plug 'airblade/vim-gitgutter'

" Color schemes
Plug 'chriskempson/base16-vim'

call plug#end()

filetype plugin indent on

let mapleader = "\<Space>"
syntax on
colorscheme base16-railscasts
let base16colorspace=256
set background=dark

let g:gitgutter_override_sign_column_highlight=0
highlight SignColumn            ctermbg=0 ctermfg=8  
highlight GitGutterAdd          ctermbg=0
highlight GitGutterChange       ctermbg=0
highlight GitGutterDelete       ctermbg=0
highlight GitGutterChangeDelete ctermbg=0
highlight LineNr                ctermbg=0 ctermfg=8

set laststatus=2        " always show status line
set statusline=%q%h\ %t\ %m%r\ %=%l:%c\ 
highlight StatusLineNC          ctermbg=0 ctermfg=8
highlight StatusLine            ctermbg=0 ctermfg=15

set autoread            " read changes to unmodified buffers
set backspace=2         " make backspace work in insert mode
set dir=~/.tmp          " store swap files in ~/.tmp
set expandtab           " tab -> spaces
set hidden              " keep buffers around when closed
set linebreak           " wrap at words
set number              " show line numbers
set numberwidth=4       " reserve 4 columns for line numbers
set showcmd             " show commands in progress
set splitbelow          " horizontal-split windows below current
set splitright          " vertical-split windows right of current
set tabstop=4           " tab width
set shiftwidth=4        " fix tab width for >> and <<
set colorcolumn=80      " highlight column 80
set clipboard=unnamed

" Netrw config
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_winsize= -35

" CtrlP config
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_map = '<Leader>o'

" vim-instant-markdown config
let g:instant_markdown_autostart=0

" window navigation
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-=> <C-w>=
nnoremap <A-c> <C-w>c
nnoremap <A-t> :vsp<cr>
nnoremap <A-n> :sp<cr>

" Key mappings
inoremap jk <esc>
nnoremap j gj
nnoremap k gk
nnoremap <c-k><c-b> :Lexplore "getcwd()"<cr>
nnoremap <A-tab> :b #<cr>
nnoremap <leader><tab> :b #<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :wq<cr>
