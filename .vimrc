if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('$HOME/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

" Functionality
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'junegunn/goyo.vim'

" Language support
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'tpope/vim-liquid'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groovy.vim'

" Interface
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bling/vim-airline'

" Color schemes
NeoBundle 'chriskempson/base16-vim'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

let mapleader = "\<Space>"
syntax on
colorscheme base16-monokai
let base16colorspace=256
set background=dark

set autoread            " read changes to unmodified buffers
set backspace=2         " make backspace work
set concealcursor=nvic  " conceal even when the cursor is on an element
set conceallevel=1      " enable conceal
set dir=~/.tmp          " store swap files in ~/.tmp
set expandtab           " tab -> spaces
set hidden              " keep buffers around when closed
set laststatus=2        " always show status line (airline)
set linebreak           " wrap at words
set number              " show line numbers
set numberwidth=4       " reserve 4 columns for line numbers
set showcmd             " show commands in progress
set splitbelow          " horizontal-split windows below current
set splitright          " vertical-split windows right of current
set tabstop=4           " tab width

" LD tagging
set iskeyword+=-
set iskeyword+=/
set tags=./tags,tags;$HOME " walk up from current dir to ~ to find tags

" Syntastic config 
let g:syntastic_auto_loc_list=2
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol ='⚠'

" vim-javascript config
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_undefined  = "¿"

" Airline config
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='base16'

" Netrw config 
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_winsize= -35

" CtrlP config
let g:ctrlp_cmd = 'CtrlPMixed'
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

if has('nvim')
        tnoremap <A-h> <C-\><C-n><C-w>h
        tnoremap <A-j> <C-\><C-n><C-w>j
        tnoremap <A-k> <C-\><C-n><C-w>k
        tnoremap <A-l> <C-\><C-n><C-w>l
endif

" Key mappings
inoremap jk <esc>
inoremap kj <esc>
nnoremap j gj
nnoremap k gk
nnoremap <c-k><c-b> :Lexplore "getcwd()"<cr>
nnoremap <leader><tab> :b #<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :wq<cr>
nnoremap <return> :noh<cr>

" Auto commands
au CompleteDone * pclose
au FileType help wincmd L | 80wincmd | | se wfw
au FileType netrw wincmd H | 35wincmd | | se wfw
