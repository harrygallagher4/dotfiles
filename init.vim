set nocompatible

call plug#begin('~/.config/nvim/plugins')

"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"endif

" Functionality
Plug 'editorconfig/editorconfig-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Plug 'w0rp/ale'
Plug 'junegunn/vim-slash'
Plug 'tpope/vim-surround'

" Language support
Plug 'tpope/vim-liquid'
Plug 'sheerun/vim-polyglot'

" Interface
Plug 'tpope/vim-vinegar'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-gitgutter'
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'chriskempson/base16-vim'

call plug#end()

filetype plugin indent on

let mapleader = "\<Space>"

function! s:base16_customize() abort
  call Base16hi("LineNr", "", g:base16_gui00, "", g:base16_cterm00, "italic", "")
  call Base16hi("CursorLineNr", "", "", "", "", "bold,italic", "")
  call Base16hi("DiffAdd", "", g:base16_gui00, "", g:base16_cterm00, "italic", "")
  call Base16hi("DiffChange", "", g:base16_gui00, "", g:base16_cterm00, "italic", "")
  call Base16hi("DiffDelete", "", g:base16_gui00, "", g:base16_cterm00, "italic", "")
  call Base16hi("DiffText", "", g:base16_gui00, "", g:base16_cterm00, "italic", "")
  call Base16hi("GitGutterAdd", "", g:base16_gui00, "", g:base16_cterm00, "italic", "")
  call Base16hi("GitGutterChange", "", g:base16_gui00, "", g:base16_cterm00, "italic", "")
  call Base16hi("GitGutterDelete", "", g:base16_gui00, "", g:base16_cterm00, "italic", "")
  call Base16hi("GitGutterText", "", g:base16_gui00, "", g:base16_cterm00, "italic", "")
endfunction

augroup on_change_colorschema
  autocmd!
  autocmd ColorScheme * call s:base16_customize()
augroup END

syntax on
set termguicolors
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
set background=dark

" highlight LineNr ctermfg=8
let g:jsx_ext_required=0    " use jsx syntax for .js files

set autoread                " read changes to unmodified buffers
set directory=~/.vim/backup " store swap files in ~/.vim/backup
set backupdir=~/.vim/backup " store backup files in ~/.vim/backup
set hidden                  " keep buffers around when closed

set linebreak               " wrap at words
set number                  " show line numbers
set numberwidth=4           " reserve 4 columns for line numbers
set cursorline
set showcmd                 " show commands in progress

set backspace=2             " make backspace work in insert mode
set splitbelow              " horizontal-split windows below current
set splitright              " vertical-split windows right of current

set hlsearch                " highlight search matches
set ignorecase              " ignore case in search
set incsearch               " show search matches while typing
set smartcase               " don't ignore case when we include an upper-case letter

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab               " tab -> spaces

set wildmenu                " use menu for tab completion
set wildmode=longest,full   " don't use menu for first completion

" let g:deoplete#enable_at_startup = 1

" windows
nnoremap <c-w>\| :vnew<cr>
nnoremap <c-w>\ :vnew<cr>
nnoremap <c-w>- :new<cr>
nnoremap <c-w>_ :new<cr>
nnoremap <c-x> :wincmd c<cr>
let g:tmux_navigator_disabled_when_zoomed = 1

" Key mappings
inoremap jk <esc>
" inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
" inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<c-k>"
nnoremap <tab> :b #<cr>
nnoremap <leader>w :w<cr>
nnoremap j gj
nnoremap k gk

" edit (neo)vim settings
nnoremap <leader>, :e ~/.dotfiles/init.vim<cr>
" reload settingss
nnoremap <leader>. :!fresh<cr>:source $MYVIMRC<cr>

autocmd BufRead,BufNewFile *.adoc set filetype=asciidoc

" reset cursor on leave
au VimLeave * set guicursor=a:hor8-blinkon1

