set nocompatible

call plug#begin('~/.config/nvim/plugins')

" Functionality
Plug 'editorconfig/editorconfig-vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-slash'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'bhurlow/vim-parinfer'

" Language support
Plug 'tpope/vim-liquid'
Plug 'sheerun/vim-polyglot'
"Plug 'jpalardy/vim-slime'
Plug 'l04m33/vlime', {'rtp': 'vim/'}

" Interface
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-gitgutter'
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'chriskempson/base16-vim'

call plug#end()

filetype plugin indent on

let mapleader = "\<Space>"

function! Base16_customize() abort
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

augroup base16_custom
    autocmd!
    autocmd ColorScheme base16-* call Base16_customize()
augroup END

"syntax on
set termguicolors
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
set background=dark

" highlight LineNr ctermfg=8
let g:jsx_ext_required=0    " use jsx syntax for .js files

set autoread                " read changes to unmodified buffers
set nobackup
set writebackup
set directory=~/.config/nvim/.backup " store swap files in ~/.vim/backup
set backupdir=~/.config/nvim/.backup " store backup files in ~/.vim/backup
set hidden                  " keep buffers around when closed
set linebreak               " wrap at words
set number                  " show line numbers
set numberwidth=4           " reserve 4 columns for line numbers
set cursorline              " highlight column with curosr in it
set noshowcmd                 " show commands in progress
set backspace=2             " make backspace work in insert mode
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
set pumheight=8
set splitbelow
set splitright
set undofile
set undodir=~/.config/nvim/.undofiles

let g:startify_customm_header = []
let g:startify_bookmarks = [{',': '~/.dotfiles/init.vim'}]
let g:startify_lists = [
  \ { 'type': 'files',     'header': ['   MRU']            },
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      }]

let g:slime_target = "neovim"
let g:slime_no_mappings = 1
xmap <c-c><c-c> <Plug>SlimeRegionSend
nmap <c-c><c-c> <Plug>SlimeParagraphSend
nmap <c-c>v     <Plug>SlimeConfig

" windows
nnoremap <c-`> :10new<cr>:term<cr>A
nnoremap \ :vnew<cr>
nnoremap - :new<cr>

nnoremap <c-x> :wincmd c<cr>
tnoremap <c-x> <c-\><c-n>:wincmd c<cr>

" <c-hjkl> for window movement
nnoremap <c-h> <c-w>h
tnoremap <c-h> <c-\><c-n><c-w>h

nnoremap <c-j> <c-w>j
tnoremap <c-j> <c-\><c-n><c-w>j

nnoremap <c-k> <c-w>k
tnoremap <c-k> <c-\><c-n><c-w>k

nnoremap <c-l> <c-w>l
tnoremap <c-l> <c-\><c-n><c-w>l

" Key mappings
inoremap jk <esc>
inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<c-k>"
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

