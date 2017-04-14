if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
endif

call plug#begin('~/.vim/plugins')

" Functionality
Plug 'editorconfig/editorconfig-vim'
Plug 'Raimondi/delimitMate'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'suan/vim-instant-markdown'
Plug 'junegunn/goyo.vim'
Plug 'easymotion/vim-easymotion'
Plug 'neomake/neomake'
Plug 'christoomey/vim-tmux-navigator'

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

colorscheme base16-3024
let base16colorspace=256
set background=dark
syntax on

let g:gitgutter_override_sign_column_highlight=0
highlight SignColumn            ctermbg=0 ctermfg=8  
highlight GitGutterAdd          ctermbg=0
highlight GitGutterChange       ctermbg=0
highlight GitGutterDelete       ctermbg=0
highlight GitGutterChangeDelete ctermbg=0
highlight LineNr                ctermbg=0 ctermfg=8

set laststatus=2            " always show status line
set statusline=%q%h\ %t\ %m%r\ %=%l:%c\ 
highlight StatusLineNC          ctermbg=0 ctermfg=8
highlight StatusLine            ctermbg=0 ctermfg=15

set autoread                " read changes to unmodified buffers
set dir=~/.tmp              " store swap files in ~/.tmp
set hidden                  " keep buffers around when closed

set linebreak               " wrap at words
set number                  " show line numbers
set numberwidth=4           " reserve 4 columns for line numbers
set showcmd                 " show commands in progress

set backspace=2             " make backspace work in insert mode
set splitbelow              " horizontal-split windows below current
set splitright              " vertical-split windows right of current

set hlsearch                " highlight search matches
set ignorecase              " ignore case in search
set incsearch               " show search matches while typing
set smartcase               " don't ignore case when we include an upper-case letter

set expandtab               " tab -> spaces
set shiftwidth=4            " fix tab width for >> and <<
set smarttab                " tab uses tabstop, shiftwidth, and softtabstop
set softtabstop=4           " represent tabs as two spaces
set tabstop=4               " tab width

set wildmenu                " use menu for tab completion
set wildmode=longest,full   " don't use menu for first completion

" Netrw config
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_winsize= -35

" CtrlP config
let g:ctrlp_map = '<Leader>o'
let g:ctrlp_working_path_mode='ra'

" vim-instant-markdown config
let g:instant_markdown_autostart=0

" neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/bin/eslint'

" windows
nnoremap <c-w>\| :vnew<cr>
nnoremap <c-w>\ :vnew<cr>
nnoremap <c-w>- :new<cr>
nnoremap <c-w>_ :new<cr>
let g:tmux_navigator_disabled_when_zoomed = 1

" Key mappings
inoremap jk <esc>
nnoremap <leader><tab> :b #<cr>
nnoremap <leader>w :w<cr>
nnoremap j gj
nnoremap k gk
