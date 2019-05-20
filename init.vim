set nocompatible

call plug#begin('~/.config/nvim/plugins')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

" Functionality
Plug 'editorconfig/editorconfig-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'

" Language support
Plug 'tpope/vim-liquid'
Plug 'sheerun/vim-polyglot'

" Interface
Plug 'tpope/vim-vinegar'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-gitgutter'
Plug 'jeffkreeftmeijer/vim-dim'

call plug#end()

filetype plugin indent on

let mapleader = "\<Space>"

syntax on
colorscheme default 
set termguicolors
set background=dark
highlight LineNr ctermfg=8
let g:jsx_ext_required=0    " use jsx syntax for .js files

set autoread                " read changes to unmodified buffers
set directory=~/.vim/backup " store swap files in ~/.vim/backup
set backupdir=~/.vim/backup " store backup files in ~/.vim/backup
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

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab               " tab -> spaces

set wildmenu                " use menu for tab completion
set wildmode=longest,full   " don't use menu for first completion

let g:deoplete#enable_at_startup = 1

" windows
nnoremap <c-w>\| :vnew<cr>
nnoremap <c-w>\ :vnew<cr>
nnoremap <c-w>- :new<cr>
nnoremap <c-w>_ :new<cr>
nnoremap <c-x> :wincmd c<cr>
let g:tmux_navigator_disabled_when_zoomed = 1

" Key mappings
inoremap jk <esc>
nnoremap <tab> :b #<cr>
nnoremap <leader>w :w<cr>
nnoremap j gj
nnoremap k gk

autocmd BufRead,BufNewFile *.adoc set filetype=asciidoc

set laststatus=2
set noshowmode

hi StatusNormal guifg=LightGrey
hi StatusInsert guibg=Yellow guifg=Black
hi StatusVisual guibg=DarkYellow guifg=Black
hi StatusReplace guibg=DarkMagenta guifg=Black

set statusline=
set statusline+=%#StatusNormal#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#StatusInsert#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#StatusReplace#%{(mode()=='r')?'\ \ REPLACE\ ':''}
set statusline+=%#StatusVisual#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#ModeMsg#      " color 
set statusline+=\ %t            " short file name
set statusline+=%(\ %m%r%h%)    " flags
set statusline+=%(\ %w%)        " preview flag
set statusline+=%(\ %q%)        " list flag
set statusline+=%=              " right align
set statusline+=%#LineNr#       " color
set statusline+=%(\ %y%)        " file type
set statusline+=%#TermCursorNC# " color
set statusline+=\ %3p%%          " percentage
set statusline+=%#Type#         " color
set statusline+=\ %3l:%-2c\     " line:column

" reset cursor on leave
au VimLeave * set guicursor=a:hor8-blinkon1
